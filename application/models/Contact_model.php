<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Contact_model extends MY_Model 
{

	protected $perPage = 20;

	public function getDefaultValues()
	{
		return [
			'name'		=> '',
			'email'		=> '',
			'phone'		=> '',
			'message'	=> ''
		];
	}

	public function getValidationRules()
	{
		$validationRules = [
			[
				'field'	=> 'name',
				'label'	=> 'Nama Lengkap',
				'rules'	=> 'trim|required'
			],
			[
				'field'	=> 'email',
				'label'	=> 'Email',
				'rules'	=> 'trim|required'
			],
			[
				'field'	=> 'phone',
				'label'	=> 'Nomor Telepon',
				'rules'	=> 'trim|required|numeric'
			],
			[
				'field'	=> 'message',
				'label'	=> 'Pesan',
				'rules'	=> 'trim|required'
			],
		];

		return $validationRules;
	}

}

/* End of file Contact_model.php */