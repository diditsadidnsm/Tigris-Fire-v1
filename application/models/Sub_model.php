<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Sub_model extends MY_Model 
{

	protected $perPage = 20;

	public function getDefaultValues()
	{
		return [
            'id'            => '',
			'id_category'	=> '',
			'slug'	        => '',
			'title'         => ''
		];
	}

	public function getValidationRules()
	{
		$validationRules = [
            [
				'field'	=> 'id_category',
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

/* End of file Sub_model.php */