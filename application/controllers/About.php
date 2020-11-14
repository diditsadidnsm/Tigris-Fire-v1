<?php

defined('BASEPATH') or exit('No direct script access allowed');

class About extends MY_Controller
{

	public function index()
	{
		$data['title']	= 'Distributor Alat Pemadam Kebakaran dan Jual Apar Murah';
	
		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/about/index');
		$this->load->view('layouts/_footer');
	}

}

/* End of file About.php */