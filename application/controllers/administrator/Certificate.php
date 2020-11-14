<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Certificate extends MY_Controller
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
		$data['title']		= 'Admin Page: Manage Certificate Tigris Fire';
		$data['content']	= $this->certificate->select(
			[
				'certificate.id', 'certificate.name AS certificate_name', 'certificate.tgl',
				'certificate.from', 'certificate.exp', 'certificate.image'
			]
		)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->certificate->count();
		$data['pagination']	= $this->certificate->makePagination(
			base_url('administrator/certificate'),
			2,
			$data['total_rows']
		);
		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_certificate');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function search($page = null)
	{
		if (isset($_POST['keyword'])) {
			$this->session->set_userdata('keyword', $this->input->post('keyword'));
		} else {
			redirect(base_url('administrator/certificate'));
		}

		$keyword	= $this->session->userdata('keyword');
		$data['title']		= 'Admin Page: Manage Certificate Tigris Fire';
		$data['content']	= $this->certificate->select(
			[
				'certificate.id', 'certificate.name AS certificate_name', 'certificate.tgl',
				'certificate.from', 'certificate.exp', 'certificate.image'
			]
		)
			->like('certificate.title', $keyword)
			->orLike('description', $keyword)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->certificate->like('certificate.title', $keyword)->orLike('description', $keyword)->count();
		$data['pagination']	= $this->certificate->makePagination(
			base_url('administrator/certificate/search'),
			3,
			$data['total_rows']
		);
		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_certificate');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function create()
	{
		if (!$_POST) {
			$input	= (object) $this->certificate->getDefaultValues();
		} else {
			$input	= (object) $this->input->post(null, true);
		}

		if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($input->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->certificate->uploadImage('image', $imageName);
			if ($upload) {
				$input->image	= $upload['file_name'];
			} else {
				redirect(base_url('administrator/certificate/create'));
			}
		}

		if (!$this->certificate->validate()) {
			$data['title']			= 'Admin Page: Create Certificate Tigris Fire';
			$data['input']			= $input;
			$data['form_action']	= base_url('administrator/certificate/create');

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_certificate');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}

		if ($this->certificate->create($input)) {
			$this->session->set_flashdata('success', 'Data berhasil disimpan!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan');
		}

		redirect(base_url('administrator/certificate'));
	}

	public function edit($id)
	{
		$data['content'] = $this->certificate->where('id', $id)->first();

		if (!$data['content']) {
			$this->session->set_flashdata('warning', 'Maaf, data tidak dapat ditemukan');
			redirect(base_url('administrator/certificate'));
		}

		if (!$_POST) {
			$data['input']	= $data['content'];
		} else {
			$data['input']	= (object) $this->input->post(null, true);
		}

		if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($data['input']->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->certificate->uploadImage('image', $imageName);
			if ($upload) {
				if ($data['content']->image !== '') {
					$this->certificate->deleteImage($data['content']->image);
				}
				$data['input']->image	= $upload['file_name'];
			} else {
				redirect(base_url("administrator/certificate/edit/$id"));
			}
		}

		if (!$this->certificate->validate()) {
			$data['title']			= 'Admin Page: Edit Certificate Tigris Fire';
			$data['form_action']	= base_url("administrator/certificate/edit/$id");

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_certificate');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}


		if ($this->certificate->where('id', $id)->update($data['input'])) {
			$this->session->set_flashdata('success', 'Data berhasil disimpan!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan');
		}

		redirect(base_url('administrator/certificate'));
	}

	public function delete($id)
	{
		if (!$_POST) {
			redirect(base_url('administrator/certificate'));
		}

		$certificate = $this->certificate->where('id', $id)->first();

		if (!$certificate) {
			$this->session->set_flashdata('warning', 'Maaf, data tidak dapat ditemukan');
			redirect(base_url('administrator/certificate'));
		}

		if ($this->certificate->where('id', $id)->delete()) {
			$this->certificate->deleteImage($certificate->image);
			$this->session->set_flashdata('success', 'Data sudah berhasil dihapus!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan!');
		}

		redirect(base_url('administrator/certificate'));
	}
}

/* End of file Certificate.php */