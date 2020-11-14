<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends MY_Controller 
{

	public function __construct()
	{
		parent::__construct();
		$is_login	= $this->session->userdata('is_login');

		if ($is_login) {
			redirect(base_url());
			return;
		}
	}

	public function index()
	{
		// $email = $this->register->getDefaultValues('email');

		if (!$_POST) {
			// $token  = base64_encode(random_bytes(32));
			// $user_token = [
			// 	'email' => $email,
			// 	'token' => $token,
			// 	'date_created' => time() 
			// ];
			$input	= (object) $this->register->getDefaultValues();
			// $this->_sendEmail();
		} else {
			$input 	= (object) $this->input->post(null, true);
		}

		if (!$this->register->validate()) {
			$data['title']	= 'Daftar Akun Tigris Fire';
			$data['input']	= $input;
			
			$this->load->view('pages/auth/register', $data);
			return;
		}

		if ($this->register->run($input)) {
			$this->session->set_flashdata('success', 'Berhasil melakukan pendaftaran! Silahkan masuk akun untuk melanjutkan');
			redirect(base_url('/login'));
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan!');
			redirect(base_url('/register'));
		}
	}

	// private function _sendEmail()
	// {
	// 	$config = [
	// 		'protocol' => 'smtp',
	// 		'smtp_host' => 'ssl://smtp.googlemail.com',
	// 		'smtp_user' => 'diditsadidnsm180818@gmail.com',
	// 		'smtp_pass' => 'Surabaya12345',
	// 		'smtp_port' => 465,
	// 		'mailtype' => 'html',
	// 		'charset' => 'utf-8',
	// 		'newline' => "\r\n"
	// 	];

	// 	$this->load->library('email', $config);

	// 	$this->email->from('diditsadidnsm180818@gmail.com', 'Nashiruddien Sadid Mustaqim');
	// 	$this->email->to('nsm180818@gmail.com');
	// 	$this->email->subject('Testing Web Application');
	// 	$this->email->message('Programming is Amazing');

	// 	if ($this->email->send())
	// 	{
	// 		return true;
	// 	} else {
	// 		echo $this->email->print_debugger();
	// 		die;
	// 	}	  
	// }

}

/* End of file Register.php */