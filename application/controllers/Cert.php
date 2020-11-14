<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Cert extends MY_Controller
{

	public function index($page = null)
	{

		$data['title']	= 'Certificate Tigris Fire';
		$data['site_desc']	= 'PT. Tigris Berkat Sejati menyediakan layanan perencanaan sistem kebakaran, pelaksanaan instalasi sistem kebakaran dan perawatan.';
		$data['site_key']	= 'jual apar murah, alat pemadam kebakaran, alat pemadam murah terdekat, jual alat pemadam murah, kebakaran, kerusakan, pemadaman';
			
		$data['content']	= $this->cert->select(
			[
				'certificate.id', 'certificate.name AS certificate_name', 'certificate.from', 'certificate.tgl', 'certificate.exp', 'certificate.link', 'certificate.image',
			]
		)
			->get();
			
		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/cert/index', $data);
		$this->load->view('layouts/_footer');
	}

}

/* End of file Cert.php */