<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Subserv extends MY_Controller
{

	public function __construct()
	{
		parent::__construct();
		$role = $this->session->userdata('role');
		if ($role != 'admin') {
			redirect(base_url('/'));
			return;
		}
	}


	public function index($page = null)
	{
		$data['title']		= 'Admin Page: Manage Sub Category Service';
		$data['content']	= $this->subserv->select(
			[
				'subserv.id', 'subserv.title AS subserv_title', 'subserv.slug',
				'catserv.title AS catserv_title'
			]
		)
			->join('catserv')
			->paginate($page)
			->get();
		$data['total_rows']	= $this->subserv->count();
		$data['pagination']	= $this->subserv->makePagination(
			base_url('administrator/subserv'),
			2,
			$data['total_rows']
		);

		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_subserv');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function search($page = null)
	{
		if (isset($_POST['keyword'])) {
			$this->session->set_userdata('keyword', $this->input->post('keyword'));
		} else {
			redirect(base_url('administrator/subserv'));
		}

		$keyword	= $this->session->userdata('keyword');
		$data['title']		= 'Admin Page: Manage Category Product';
		$data['content']	= $this->subserv->like('title', $keyword)->paginate($page)->get();
		$data['total_rows']	= $this->subserv->like('title', $keyword)->count();
		$data['pagination']	= $this->subserv->makePagination(
			base_url('administrator/subserv/search'),
			3,
			$data['total_rows']
		);

		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_subserv');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function create()
	{
		if (!$_POST) {
			$input	= (object) $this->subserv->getDefaultValues();
		} else {
			$input	= (object) $this->input->post(null, true);
        }
        
        if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($input->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->subserv->uploadImage('image', $imageName);
			if ($upload) {
				$input->image	= $upload['file_name'];
			} else {
				redirect(base_url('administrator/subserv/create'));
			}
		}

		if (!$this->subserv->validate()) {
			$data['title']			= 'Admin Page: Create Sub Category Service';
			$data['input']			= $input;
			$data['form_action']	= base_url('administrator/subserv/create');

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_subserv');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}

		if ($this->subserv->create($input)) {
			$this->session->set_flashdata('success', 'Data berhasil disimpan!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan');
		}

		redirect(base_url('administrator/subserv'));
	}

	public function edit($id)
	{
		$data['content'] = $this->subserv->where('id', $id)->first();

		if (!$data['content']) {
			$this->session->set_flashdata('warning', 'Maaf! Data tidak ditemukan!');
			redirect(base_url('administrator/subserv'));
		}

		if (!$_POST) {
			$data['input']	= $data['content'];
		} else {
			$data['input']	= (object) $this->input->post(null, true);
        }
        
        if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($data['input']->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->subserv->uploadImage('image', $imageName);
			if ($upload) {
				if ($data['content']->image !== '') {
					$this->subserv->deleteImage($data['content']->image);
				}
				$data['input']->image	= $upload['file_name'];
			} else {
				redirect(base_url("administrator/subserv/edit/$id"));
			}
		}

		if (!$this->subserv->validate()) {
			$data['title']			= 'Admin Page: Edit Sub Category Service';
			$data['form_action']	= base_url("administrator/subserv/edit/$id");

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_subserv');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}

		if ($this->subserv->where('id', $id)->update($data['input'])) {
			$this->session->set_flashdata('success', 'Data berhasil diperbaharui!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan.');
		}

		redirect(base_url('administrator/subserv'));
	}

	public function delete($id)
	{
		if (!$_POST) {
			redirect(base_url('administrator/subserv'));
		}

		if (!$this->subserv->where('id', $id)->first()) {
			$this->session->set_flashdata('warning', 'Maaf! Data tidak ditemukan.');
			redirect(base_url('administrator/subserv'));
		}

		if ($this->subserv->where('id', $id)->delete()) {
			$this->session->set_flashdata('success', 'Data sudah berhasil dihapus!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan.');
		}

		redirect(base_url('administrator/subserv'));
	}

	public function unique_slug()
	{
		$slug		= $this->input->post('slug');
		$id			= $this->input->post('id');
		$subserv	= $this->subserv->where('slug', $slug)->first();

		if ($subserv) {
			if ($id == $subserv->id) {
				return true;
			}
			$this->load->library('form_validation');
			$this->form_validation->set_message('unique_slug', '%s sudah digunakan!');
			return false;
		}

		return true;
	}
}

/* End of file Subserv.php */