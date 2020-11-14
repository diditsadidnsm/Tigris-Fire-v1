<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Service_model extends MY_Model 
{

	protected $perPage = 1000;

	public function getDefaultValues()
	{
		return [
			'id_catserv'	=> '',
			'id_subserv'	    => '',
			'slug'			=> '',
			'title'			=> '',
			'intro'			=> '',
			'description'	=> '',
			'price'			=> '',
			'writer'		=> '',
			'is_available'	=> 1,
			'image'			=> ''
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
				'field'	=> 'id_subserv',
				'label'	=> 'Sub Kategori',
				'rules'	=> 'required'
			],
			[
				'field'	=> 'slug',
				'label'	=> 'Slug',
				'rules'	=> 'trim|required|callback_unique_slug'
			],
			[
				'field'	=> 'title',
				'label'	=> 'Nama Produk',
				'rules'	=> 'trim|required'
			],
			[
				'field'	=> 'intro',
				'label'	=> 'Intro',
				'rules'	=> 'trim|required'
			],
			[
				'field'	=> 'description',
				'label'	=> 'Deskripsi',
				'rules'	=> 'trim|required'
			],
			[
				'field'	=> 'price',
				'label'	=> 'Harga',
				'rules'	=> 'trim|required'
			],
			[
				'field'	=> 'is_available',
				'label'	=> 'Ketersediaan',
				'rules'	=> 'required'
			],
		];

		return $validationRules;
	}

	public function uploadImage($fieldName, $fileName)
	{
		$config	= [
			'upload_path'		=> './images/service',
			'file_name'			=> $fileName,
			'allowed_types'		=> 'jpg|gif|png|jpeg|JPG|PNG',
			'max_size'			=> 1024,
			'max_width'			=> 0,
			'max_height'		=> 0,
			'overwrite'			=> true,
			'file_ext_tolower'	=> true
		];

		$this->load->library('upload', $config);

		if ($this->upload->do_upload($fieldName)) {
			return $this->upload->data();
		} else {
			$this->session->set_flashdata('image_error', $this->upload->display_errors('', ''));
			return false;
		}
	}

	public function deleteImage($fileName)
	{
		if (file_exists("./images/service/$fileName")) {
			unlink("./images/service/$fileName");
		}
	}

}

/* End of file Service_model.php */