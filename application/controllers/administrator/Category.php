<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Category extends MY_Controller
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
		$data['title']		= 'Admin Page: Manage Category Product';
		$data['content']	= $this->category->paginate($page)->get();
		$data['total_rows']	= $this->category->count();
		$data['pagination']	= $this->category->makePagination(
			base_url('administrator/category'),
			2,
			$data['total_rows']
		);

		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_category');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function search($page = null)
	{
		if (isset($_POST['keyword'])) {
			$this->session->set_userdata('keyword', $this->input->post('keyword'));
		} else {
			redirect(base_url('administrator/category'));
		}

		$keyword	= $this->session->userdata('keyword');
		$data['title']		= 'Admin Page: Manage Category Product';
		$data['content']	= $this->category->like('title', $keyword)->paginate($page)->get();
		$data['total_rows']	= $this->category->like('title', $keyword)->count();
		$data['pagination']	= $this->category->makePagination(
			base_url('administrator/category/search'),
			3,
			$data['total_rows']
		);

		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_category');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function create()
	{
		if (!$_POST) {
			$input	= (object) $this->category->getDefaultValues();
		} else {
			$input	= (object) $this->input->post(null, true);
        }
        
        if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($input->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->category->uploadImage('image', $imageName);
			if ($upload) {
				$input->image	= $upload['file_name'];
			} else {
				redirect(base_url('administrator/category/create'));
			}
		}

		if (!$this->category->validate()) {
			$data['title']			= 'Admin Page: Create Category Product';
			$data['input']			= $input;
			$data['form_action']	= base_url('administrator/category/create');

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_category');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}

		if ($this->category->create($input)) {
			$this->session->set_flashdata('success', 'Data berhasil disimpan!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan');
		}

		redirect(base_url('administrator/category'));
	}

	public function edit($id)
	{
		$data['content'] = $this->category->where('id', $id)->first();

		if (!$data['content']) {
			$this->session->set_flashdata('warning', 'Maaf! Data tidak ditemukan!');
			redirect(base_url('administrator/category'));
		}

		if (!$_POST) {
			$data['input']	= $data['content'];
		} else {
			$data['input']	= (object) $this->input->post(null, true);
        }
        
        if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($data['input']->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->category->uploadImage('image', $imageName);
			if ($upload) {
				if ($data['content']->image !== '') {
					$this->category->deleteImage($data['content']->image);
				}
				$data['input']->image	= $upload['file_name'];
			} else {
				redirect(base_url("administrator/category/edit/$id"));
			}
		}

		if (!$this->category->validate()) {
			$data['title']			= 'Admin Page: Edit Category Product';
			$data['form_action']	= base_url("administrator/category/edit/$id");

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_category');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}

		if ($this->category->where('id', $id)->update($data['input'])) {
			$this->session->set_flashdata('success', 'Data berhasil diperbaharui!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan.');
		}

		redirect(base_url('administrator/category'));
	}

	public function delete($id)
	{
		if (!$_POST) {
			redirect(base_url('administrator/category'));
		}

		if (!$this->category->where('id', $id)->first()) {
			$this->session->set_flashdata('warning', 'Maaf! Data tidak ditemukan.');
			redirect(base_url('administrator/category'));
		}

		if ($this->category->where('id', $id)->delete()) {
			$this->session->set_flashdata('success', 'Data sudah berhasil dihapus!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan.');
		}

		redirect(base_url('administrator/category'));
	}

	public function unique_slug()
	{
		$slug		= $this->input->post('slug');
		$id			= $this->input->post('id');
		$category	= $this->category->where('slug', $slug)->first();

		if ($category) {
			if ($id == $category->id) {
				return true;
			}
			$this->load->library('form_validation');
			$this->form_validation->set_message('unique_slug', '%s sudah digunakan!');
			return false;
		}

		return true;
	}
}

/* End of file Category.php */