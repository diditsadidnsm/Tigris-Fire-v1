<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Product extends MY_Controller
{

	public function __construct()
	{
		parent::__construct();
		$role = $this->session->userdata('role');
		if ($role != 'admin') {
			redirect(base_url('/'));
			return;
		}
	}


	public function index($page = null)
	{
		$data['title']		= 'Admin Page: Manage Primary Produk';
		$data['content']	= $this->product->select(
			[
				'product.id', 'product.title AS product_title', 'product.image',
				'product.price', 'product.is_available',
				'category.title AS category_title'
			]
		)
			->join('category')
			->orderBy('product.id', 'desc')
			->paginate($page)
			->get();
		$data['total_rows']	= $this->product->count();
		$data['pagination']	= $this->product->makePagination(
			base_url('administrator/product'),
			2,
			$data['total_rows']
		);
		
		
		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_product');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function search($page = null)
	{
		if (isset($_POST['keyword'])) {
			$this->session->set_userdata('keyword', $this->input->post('keyword'));
		} else {
			redirect(base_url('administrator/product'));
		}

		$keyword	= $this->session->userdata('keyword');
		$data['title']		= 'Admin Page: Manage Primary Produk';
		$data['content']	= $this->product->select(
			[
				'product.id', 'product.title AS product_title', 'product.image',
				'product.price', 'product.is_available',
				'category.title AS category_title'
			]
		)
			->join('category')
			->like('product.title', $keyword)
			->orLike('description', $keyword)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->product->like('product.title', $keyword)->orLike('description', $keyword)->count();
		$data['pagination']	= $this->product->makePagination(
			base_url('administrator/product/search'),
			3,
			$data['total_rows']
		);
		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_product');
		$this->load->view('administrator/material/nsm_footer');
	}

	public function create()
	{
		if (!$_POST) {
			$input	= (object) $this->product->getDefaultValues();
		} else {
			$input	= (object) $this->input->post(null, true);
		}

		if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($input->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->product->uploadImage('image', $imageName);
			if ($upload) {
				$input->image	= $upload['file_name'];
			} else {
				redirect(base_url('administrator/product/create'));
			}
		}

		if (!$this->product->validate()) {
			$data['title']			= 'Admin Page: Create Primary Produk';
			$data['input']			= $input;
			$data['form_action']	= base_url('administrator/product/create');

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_product');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}

		if ($this->product->create($input)) {
			$this->session->set_flashdata('success', 'Data berhasil disimpan!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan');
		}

		redirect(base_url('administrator/product'));
	}

	public function edit($id)
	{
		$data['content'] = $this->product->where('id', $id)->first();

		if (!$data['content']) {
			$this->session->set_flashdata('warning', 'Maaf, data tidak dapat ditemukan');
			redirect(base_url('administrator/product'));
		}

		if (!$_POST) {
			$data['input']	= $data['content'];
		} else {
			$data['input']	= (object) $this->input->post(null, true);
		}

		if (!empty($_FILES) && $_FILES['image']['name'] !== '') {
			$imageName	= url_title($data['input']->title, '-', true) . '-' . date('YmdHis');
			$upload		= $this->product->uploadImage('image', $imageName);
			if ($upload) {
				if ($data['content']->image !== '') {
					$this->product->deleteImage($data['content']->image);
				}
				$data['input']->image	= $upload['file_name'];
			} else {
				redirect(base_url("administrator/product/edit/$id"));
			}
		}

		if (!$this->product->validate()) {
			$data['title']			= 'Admin Page: Edit Primary Produk';
			$data['form_action']	= base_url("administrator/product/edit/$id");

			$this->load->view('administrator/material/nsm_header', $data);
		    $this->load->view('administrator/material/nsm_navbar', $data);
		    $this->load->view('administrator/material/nsm_layout');
		    $this->load->view('administrator/material/nsm_sidebar');
		    $this->load->view('administrator/form/f_product');
		    $this->load->view('administrator/material/nsm_footer');
			return;
		}


		if ($this->product->where('id', $id)->update($data['input'])) {
			$this->session->set_flashdata('success', 'Data berhasil disimpan!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan');
		}

		redirect(base_url('administrator/product'));
	}

	public function delete($id)
	{
		if (!$_POST) {
			redirect(base_url('administrator/product'));
		}

		$product = $this->product->where('id', $id)->first();

		if (!$product) {
			$this->session->set_flashdata('warning', 'Maaf, data tidak dapat ditemukan');
			redirect(base_url('administrator/product'));
		}

		if ($this->product->where('id', $id)->delete()) {
			$this->product->deleteImage($product->image);
			$this->session->set_flashdata('success', 'Data sudah berhasil dihapus!');
		} else {
			$this->session->set_flashdata('error', 'Oops! Terjadi suatu kesalahan!');
		}

		redirect(base_url('administrator/product'));
	}

	public function unique_slug()
	{
		$slug		= $this->input->post('slug');
		$id			= $this->input->post('id');
		$product	= $this->product->where('slug', $slug)->first();

		if ($product) {
			if ($id == $product->id) {
				return true;
			}
			$this->load->library('form_validation');
			$this->form_validation->set_message('unique_slug', '%s sudah digunakan!');
			return false;
		}

		return true;
	}
}

/* End of file Product.php */