<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Feedback extends MY_Controller
{

	public function index($page = null)
	{
		
		$data['title']	= 'Feedpack Users Tigris Fire';
			
		$data['content']	= $this->feedback->select(
			[
				'contact.id', 'contact.name AS contact_name',
				'contact.email AS contact_email', 'contact.phone AS contact_phone',
				'contact.message AS contact_message',
			]
		)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->feedback->count();
		$data['pagination']	= $this->feedback->makePagination(
			base_url('administrator/feedback'),
			2,
			$data['total_rows']
		);
		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_feedback');
		$this->load->view('administrator/material/nsm_footer');
	}
	
	public function delete($id)
	{
		if (!$_POST) {
			redirect(base_url('administrator/feedback'));
		}

		if (!$this->feedback->where('id', $id)->first()) {
			$this->session->set_flashdata('warning', 'Maaf! Data tidak ditemukan.');
			redirect(base_url('administrator/feedback'));
		}

		if ($this->feedback->where('id', $id)->delete()) {
			$this->session->set_flashdata('success', 'Data sudah berhasil dihapus!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan.');
		}

		redirect(base_url('administrator/feedback'));
	}

}

/* End of file Feedback.php */