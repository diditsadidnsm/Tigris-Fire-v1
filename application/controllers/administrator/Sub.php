<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Sub extends MY_Controller
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
		$data['title']		= 'Admin Page: Manage Sub Category Product';
		$data['content']	= $this->sub->select(
			[
				'sub.id', 'sub.title AS sub_title', 'sub.slug',
				'category.title AS category_title'
			]
		)
			->join('category')
			->paginate($page)
			->get();
		$data['total_rows']	= $this->sub->count();
		$data['pagination']	= $this->sub->makePagination(
			base_url('administrator/sub'),
			2,
			$data['total_rows']
		);

		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_sub');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function search($page = null)
	{
		if (isset($_POST['keyword'])) {
			$this->session->set_userdata('keyword', $this->input->post('keyword'));
		} else {
			redirect(base_url('administrator/sub'));
		}

		$keyword	= $this->session->userdata('keyword');
		$data['title']		= 'Admin Page: Manage Category Product';
		$data['content']	= $this->sub->like('title', $keyword)->paginate($page)->get();
		$data['total_rows']	= $this->sub->like('title', $keyword)->count();
		$data['pagination']	= $this->sub->makePagination(
			base_url('administrator/sub/search'),
			3,
			$data['total_rows']
		);

		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_sub');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function create()
	{
		if (!$_POST) {
			$input	= (object) $this->sub->getDefaultValues();
		} else {
			$input	= (object) $this->input->post(null, true);
        }
        
        if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($input->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->sub->uploadImage('image', $imageName);
			if ($upload) {
				$input->image	= $upload['file_name'];
			} else {
				redirect(base_url('administrator/sub/create'));
			}
		}

		if (!$this->sub->validate()) {
			$data['title']			= 'Admin Page: Create Sub Category Product';
			$data['input']			= $input;
			$data['form_action']	= base_url('administrator/sub/create');

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_sub');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}

		if ($this->sub->create($input)) {
			$this->session->set_flashdata('success', 'Data berhasil disimpan!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan');
		}

		redirect(base_url('administrator/sub'));
	}

	public function edit($id)
	{
		$data['content'] = $this->sub->where('id', $id)->first();

		if (!$data['content']) {
			$this->session->set_flashdata('warning', 'Maaf! Data tidak ditemukan!');
			redirect(base_url('administrator/sub'));
		}

		if (!$_POST) {
			$data['input']	= $data['content'];
		} else {
			$data['input']	= (object) $this->input->post(null, true);
        }
        
        if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($data['input']->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->sub->uploadImage('image', $imageName);
			if ($upload) {
				if ($data['content']->image !== '') {
					$this->sub->deleteImage($data['content']->image);
				}
				$data['input']->image	= $upload['file_name'];
			} else {
				redirect(base_url("administrator/sub/edit/$id"));
			}
		}

		if (!$this->sub->validate()) {
			$data['title']			= 'Admin Page: Edit Sub Category Product';
			$data['form_action']	= base_url("administrator/sub/edit/$id");

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_sub');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}

		if ($this->sub->where('id', $id)->update($data['input'])) {
			$this->session->set_flashdata('success', 'Data berhasil diperbaharui!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan.');
		}

		redirect(base_url('administrator/sub'));
	}

	public function delete($id)
	{
		if (!$_POST) {
			redirect(base_url('administrator/sub'));
		}

		if (!$this->sub->where('id', $id)->first()) {
			$this->session->set_flashdata('warning', 'Maaf! Data tidak ditemukan.');
			redirect(base_url('administrator/sub'));
		}

		if ($this->sub->where('id', $id)->delete()) {
			$this->session->set_flashdata('success', 'Data sudah berhasil dihapus!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan.');
		}

		redirect(base_url('administrator/sub'));
	}

	public function unique_slug()
	{
		$slug		= $this->input->post('slug');
		$id			= $this->input->post('id');
		$sub	    = $this->sub->where('slug', $slug)->first();

		if ($sub) {
			if ($id == $sub->id) {
				return true;
			}
			$this->load->library('form_validation');
			$this->form_validation->set_message('unique_slug', '%s sudah digunakan!');
			return false;
		}

		return true;
	}
}

/* End of file Sub.php */