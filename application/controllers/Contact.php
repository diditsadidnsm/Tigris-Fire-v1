<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Contact extends MY_Controller
{

	public function index($page = null)
	{

		{
		if (!$_POST) {
			$input	= (object) $this->contact->getDefaultValues();
		} else {
			$input	= (object) $this->input->post(null, true);
		}

		if (!$this->contact->validate()) {
			$data['title']			= 'Distributor Alat Pemadam Kebakaran dan Jual Apar Murah';
			$data['site_desc']	    = 'PT. Tigris Berkat Sejati menyediakan layanan perencanaan sistem kebakaran, pelaksanaan instalasi sistem kebakaran dan perawatan.';
		    $data['site_key']	    = 'jual apar murah, alat pemadam kebakaran, alat pemadam murah terdekat, jual alat pemadam murah, kebakaran, kerusakan, pemadaman';
			$data['input']			= $input;
			$data['form_action']	= base_url('contact');

			$this->load->view('layouts/_header', $data);
		    $this->load->view('layouts/_navbar', $data);
		    $this->load->view('pages/contact/index', $data);
		    $this->load->view('layouts/_footer');
			return;
		}

		if ($this->contact->create($input)) {
			$this->session->set_flashdata('success', 'Pesan anda telah kami terima, Terima Kasih atas Feedback yang anda berikan!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan');
		}

		redirect(base_url('contact'));
	    }
	
	}

}

/* End of file Contact.php */