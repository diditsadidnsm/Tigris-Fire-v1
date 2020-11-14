<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Service extends MY_Controller
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
		$data['title']		= 'Admin Page: Manage Primary Service';
		$data['content']	= $this->service->select(
			[
				'service.id', 'service.title AS service_title', 'service.image',
				'service.price', 'service.is_available',
				'catserv.title AS catserv_title'
			]
		)
			->join('catserv')
			->paginate($page)
			->get();
		$data['total_rows']	= $this->service->count();
		$data['pagination']	= $this->service->makePagination(
			base_url('administrator/service'),
			2,
			$data['total_rows']
		);
		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_service');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function search($page = null)
	{
		if (isset($_POST['keyword'])) {
			$this->session->set_userdata('keyword', $this->input->post('keyword'));
		} else {
			redirect(base_url('administrator/service'));
		}

		$keyword	= $this->session->userdata('keyword');
		$data['title']		= 'Admin Page: Manage Primary Service';
		$data['content']	= $this->service->select(
			[
				'service.id', 'service.title AS service_title', 'service.image',
				'service.price', 'service.is_available',
				'category.title AS category_title'
			]
		)
			->join('category')
			->like('service.title', $keyword)
			->orLike('description', $keyword)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->service->like('service.title', $keyword)->orLike('description', $keyword)->count();
		$data['pagination']	= $this->service->makePagination(
			base_url('administrator/service/search'),
			3,
			$data['total_rows']
		);
		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_service');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function create()
	{
		if (!$_POST) {
			$input	= (object) $this->service->getDefaultValues();
		} else {
			$input	= (object) $this->input->post(null, true);
		}

		if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($input->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->service->uploadImage('image', $imageName);
			if ($upload) {
				$input->image	= $upload['file_name'];
			} else {
				redirect(base_url('administrator/service/create'));
			}
		}

		if (!$this->service->validate()) {
			$data['title']			= 'Admin Page: Create Primary Service';
			$data['input']			= $input;
			$data['form_action']	= base_url('administrator/service/create');

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_service');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}

		if ($this->service->create($input)) {
			$this->session->set_flashdata('success', 'Data berhasil disimpan!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan');
		}

		redirect(base_url('administrator/service'));
	}

	public function edit($id)
	{
		$data['content'] = $this->service->where('id', $id)->first();

		if (!$data['content']) {
			$this->session->set_flashdata('warning', 'Maaf, data tidak dapat ditemukan');
			redirect(base_url('administrator/service'));
		}

		if (!$_POST) {
			$data['input']	= $data['content'];
		} else {
			$data['input']	= (object) $this->input->post(null, true);
		}

		if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($data['input']->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->service->uploadImage('image', $imageName);
			if ($upload) {
				if ($data['content']->image !== '') {
					$this->service->deleteImage($data['content']->image);
				}
				$data['input']->image	= $upload['file_name'];
			} else {
				redirect(base_url("administrator/service/edit/$id"));
			}
		}

		if (!$this->service->validate()) {
			$data['title']			= 'Admin Page: Edit Primary Service';
			$data['form_action']	= base_url("administrator/service/edit/$id");

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_service');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}


		if ($this->service->where('id', $id)->update($data['input'])) {
			$this->session->set_flashdata('success', 'Data berhasil disimpan!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan');
		}

		redirect(base_url('administrator/service'));
	}

	public function delete($id)
	{
		if (!$_POST) {
			redirect(base_url('administrator/service'));
		}

		$service = $this->service->where('id', $id)->first();

		if (!$service) {
			$this->session->set_flashdata('warning', 'Maaf, data tidak dapat ditemukan');
			redirect(base_url('administrator/service'));
		}

		if ($this->service->where('id', $id)->delete()) {
			$this->service->deleteImage($service->image);
			$this->session->set_flashdata('success', 'Data sudah berhasil dihapus!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan!');
		}

		redirect(base_url('administrator/service'));
	}

	public function unique_slug()
	{
		$slug		= $this->input->post('slug');
		$id			= $this->input->post('id');
		$service	= $this->service->where('slug', $slug)->first();

		if ($service) {
			if ($id == $service->id) {
				return true;
			}
			$this->load->library('form_validation');
			$this->form_validation->set_message('unique_slug', '%s sudah digunakan!');
			return false;
		}

		return true;
	}
}

/* End of file Service.php */