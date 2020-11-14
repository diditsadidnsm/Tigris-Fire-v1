<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Shop extends MY_Controller
{

	public function index($page = null)
	{
		$data['title']	= 'Menyediakan Product Pemadam Kebakaran Termurah dan Berkualitas';
		$data['content']	= $this->shop->select(
			[
				'product.id', 'product.slug AS product_slug', 'product.price AS product_price', 'product.title AS product_title',
				'product.intro AS product_intro', 'product.description', 'product.image',
				'product.price', 'product.is_available',
				'category.title AS category_title', 'category.slug AS category_slug'
			]
		)
			->join('category')
			->where('product.is_available', 1)
			->orderBy('product.id', 'desc')
			->paginate($page)
			->get();
		$data['total_rows']	= $this->shop->where('product.is_available', 1)->count();
		$data['pagination']	= $this->shop->makePagination(
			base_url('shop'),
			2,
			$data['total_rows']
		);
		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/shop/index', $data);
		$this->load->view('layouts/_footer');
	}

	public function sortby($sort, $page = null)
	{
		$data['title']	= 'Belanja'; 
		$data['content']	= $this->shop->select(
			[
				'product.id', 'product.slug AS product_slug', 'product.price AS product_price', 'product.title AS product_title',
				'product.intro AS product_intro', 'product.description', 'product.image',
				'product.price', 'product.is_available',
				'category.title AS category_title', 'category.slug AS category_slug'
			]
		)
			->join('category')
			->where('product.is_available', 1)
			->orderBy('product.price', $sort)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->shop->where('product.is_available', 1)->count();
		$data['pagination']	= $this->shop->makePagination(
			base_url("shop/sortby/$sort"),
			4,
			$data['total_rows']
		);
		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/shop/index', $data);
		$this->load->view('layouts/_footer');
	}

	public function category($category, $page = null)
	{
		$data['title']		= 'Belanja';
		$data['content']	= $this->shop->select(
			[
				'product.id', 'product.slug AS product_slug', 'product.price AS product_price', 'product.title AS product_title',
				'product.intro AS product_intro', 'product.description', 'product.image',
				'product.price', 'product.is_available',
				'category.title AS category_title', 'category.slug AS category_slug'
			]
		)
			->join('category')
			->where('product.is_available', 1)
			->where('category.slug', $category)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->shop->where('product.is_available', 1)->where('category.slug', $category)->join('category')->count();
		$data['pagination']	= $this->shop->makePagination(
			base_url("shop/category/$category"),
			4,
			$data['total_rows']
		);
		$data['category']	= ucwords(str_replace('-', ' ', $category));
		
		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/shop/index', $data);
		$this->load->view('layouts/_footer');
	}
	
	public function sub($sub, $page = null)
	{
		$data['title']		= 'Belanja';
		$data['content']	= $this->shop->select(
			[
				'product.id', 'product.slug AS product_slug', 'product.price AS product_price', 'product.title AS product_title',
				'product.intro AS product_intro', 'product.description', 'product.image',
				'product.price', 'product.is_available',
				'sub.title AS sub_title', 'sub.slug AS sub_slug'
			]
		)
			->join('sub')
			->where('product.is_available', 1)
			->where('sub.slug', $sub)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->shop->where('product.is_available', 1)->where('sub.slug', $sub)->join('sub')->count();
		$data['pagination']	= $this->shop->makePagination(
			base_url("shop/sub/$sub"),
			4,
			$data['total_rows']
		);
		$data['sub']	= ucwords(str_replace('-', ' ', $sub));
		
		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/shop/index', $data);
		$this->load->view('layouts/_footer');
	}

	public function search($page = null)
	{
		if (isset($_POST['keyword'])) {
			$this->session->set_userdata('keyword', $this->input->post('keyword'));
		} else {
			redirect(base_url('/'));
		}

		$keyword	= $this->session->userdata('keyword');
		$data['title']		= 'Pencarian: Produk';
		$data['content']	= $this->shop->select(
			[
				'product.id', 'product.slug AS product_slug', 'product.price AS product_price', 'product.title AS product_title',
				'product.intro AS product_intro', 'product.description', 'product.image',
				'product.price', 'product.is_available',
				'category.title AS category_title', 'category.slug AS category_slug'
			]
		)
			->join('category')
			->like('product.title', $keyword)
			->orLike('product.description', $keyword)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->shop->like('product.title', $keyword)->orLike('product.description', $keyword)->count();
		$data['pagination']	= $this->shop->makePagination(
			base_url('shop/search'),
			3,
			$data['total_rows']
		);
		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/shop/index', $data);
		$this->load->view('layouts/_footer');
	}

	public function detail()
	{
		$slug = $this->uri->segment(3);
		$data['title']	= $slug;
		$data['rows'] = $this->db->get_where('product', ['slug' => $slug])->row();

		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/shop/detail', $data);
		$this->load->view('layouts/_footer');
	}
}

/* End of file Shop.php */