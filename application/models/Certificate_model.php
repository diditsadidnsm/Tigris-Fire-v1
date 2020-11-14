<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Certificate_model extends MY_Model 
{

	protected $perPage = 20;

	public function getDefaultValues()
	{
		return [
			'name'			=> '',
			'tgl'			=> '',
			'from'			=> '',
			'exp'	        => '',
			'link'	        => '',
			'image'			=> ''
		];
	}

	public function getValidationRules()
	{
		$validationRules = [
			[
				'field'	=> 'name',
				'label'	=> 'Nama Sertifikat',
				'rules'	=> 'trim|required'
			],
			[
				'field'	=> 'tgl',
				'label'	=> 'Tanggal Pemberian',
				'rules'	=> 'trim|required'
			],
			[
				'field'	=> 'from',
				'label'	=> 'Dari Mana',
				'rules'	=> 'trim|required'
			],
			[
				'field'	=> 'exp',
				'label'	=> 'Masa Berlaku',
				'rules'	=> 'trim|required'
			],
			[
				'field'	=> 'link',
				'label'	=> 'Link Download',
				'rules'	=> ''
			],
		];

		return $validationRules;
	}

	public function uploadImage($fieldName, $fileName)
	{
		$config	= [
			'upload_path'		=> './images/certificate',
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
		if (file_exists("./images/certificate/$fileName")) {
			unlink("./images/certificate/$fileName");
		}
	}

}

/* End of file Certificate_model.php */