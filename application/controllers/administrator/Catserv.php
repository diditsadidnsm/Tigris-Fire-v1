<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Catserv extends MY_Controller
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
		$data['title']		= 'Admin Page: Manage Category Service';
		$data['content']	= $this->catserv->paginate($page)->get();
		$data['total_rows']	= $this->catserv->count();
		$data['pagination']	= $this->catserv->makePagination(
			base_url('administrator/catserv'),
			2,
			$data['total_rows']
		);

		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_catserv');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function search($page = null)
	{
		if (isset($_POST['keyword'])) {
			$this->session->set_userdata('keyword', $this->input->post('keyword'));
		} else {
			redirect(base_url('administrator/catserv'));
		}

		$keyword	= $this->session->userdata('keyword');
		$data['title']		= 'Admin Page: Manage Category Service';
		$data['content']	= $this->catserv->like('title', $keyword)->paginate($page)->get();
		$data['total_rows']	= $this->catserv->like('title', $keyword)->count();
		$data['pagination']	= $this->catserv->makePagination(
			base_url('administrator/catserv/search'),
			3,
			$data['total_rows']
		);

		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_catserv');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function create()
	{
		if (!$_POST) {
			$input	= (object) $this->catserv->getDefaultValues();
		} else {
			$input	= (object) $this->input->post(null, true);
        }
        
        if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($input->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->catserv->uploadImage('image', $imageName);
			if ($upload) {
				$input->image	= $upload['file_name'];
			} else {
				redirect(base_url('administrator/catserv/create'));
			}
		}

		if (!$this->catserv->validate()) {
			$data['title']			= 'Admin Page: Create Category Service';
			$data['input']			= $input;
			$data['form_action']	= base_url('administrator/catserv/create');

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_catserv');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}

		if ($this->catserv->create($input)) {
			$this->session->set_flashdata('success', 'Data berhasil disimpan!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan');
		}

		redirect(base_url('administrator/catserv'));
	}

	public function edit($id)
	{
		$data['content'] = $this->catserv->where('id', $id)->first();

		if (!$data['content']) {
			$this->session->set_flashdata('warning', 'Maaf! Data tidak ditemukan!');
			redirect(base_url('administrator/catserv'));
		}

		if (!$_POST) {
			$data['input']	= $data['content'];
		} else {
			$data['input']	= (object) $this->input->post(null, true);
        }
        
        if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($data['input']->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->catserv->uploadImage('image', $imageName);
			if ($upload) {
				if ($data['content']->image !== '') {
					$this->catserv->deleteImage($data['content']->image);
				}
				$data['input']->image	= $upload['file_name'];
			} else {
				redirect(base_url("administrator/catserv/edit/$id"));
			}
		}

		if (!$this->catserv->validate()) {
			$data['title']			= 'Admin Page: Edit Category Service';
			$data['form_action']	= base_url("administrator/catserv/edit/$id");

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_catserv');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}

		if ($this->catserv->where('id', $id)->update($data['input'])) {
			$this->session->set_flashdata('success', 'Data berhasil diperbaharui!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan.');
		}

		redirect(base_url('administrator/catserv'));
	}

	public function delete($id)
	{
		if (!$_POST) {
			redirect(base_url('administrator/catserv'));
		}

		if (!$this->catserv->where('id', $id)->first()) {
			$this->session->set_flashdata('warning', 'Maaf! Data tidak ditemukan.');
			redirect(base_url('administrator/catserv'));
		}

		if ($this->catserv->where('id', $id)->delete()) {
			$this->session->set_flashdata('success', 'Data sudah berhasil dihapus!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan.');
		}

		redirect(base_url('administrator/catserv'));
	}

	public function unique_slug()
	{
		$slug		= $this->input->post('slug');
		$id			= $this->input->post('id');
		$catserv	= $this->catserv->where('slug', $slug)->first();

		if ($catserv) {
			if ($id == $catserv->id) {
				return true;
			}
			$this->load->library('form_validation');
			$this->form_validation->set_message('unique_slug', '%s sudah digunakan!');
			return false;
		}

		return true;
	}
}

/* End of file Catserv.php */