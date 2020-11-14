<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Subserv_model extends MY_Model 
{

	protected $perPage = 20;

	public function getDefaultValues()
	{
		return [
            'id'            => '',
			'id_catserv'	=> '',
			'slug'	        => '',
			'title'         => ''
		];
	}

	public function getValidationRules()
	{
		$validationRules = [
            [
				'field'	=> 'id_catserv',
				'label'	=> 'Kategori',
				'rules'	=> 'required'
			],
			[
				'field'	=> 'slug',
				'label'	=> 'Slug',
				'rules' => 'trim|required|callback_unique_slug'
			],
			[
				'field'	=> 'title',
				'label'	=> 'Nama Sub Kategori',
				'rules' => 'trim|required'
			],
		];

		return $validationRules;
	}

}

/* End of file Subserv_model.php */