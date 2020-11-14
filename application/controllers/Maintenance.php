<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Maintenance extends MY_Controller
{

	public function index($page = null)
	{
		$data['title']	= 'Menyediakan Layanan Pemadam Kebakaran Termurah dan Berkualitas';
		$data['content']	= $this->maintenance->select(
			[
				'service.id', 'service.slug AS service_slug', 'service.title AS service_title',
				'service.intro AS service_intro', 'service.description', 'service.image',
				'service.price', 'service.is_available',
				'catserv.title AS catserv_title', 'catserv.slug AS catserv_slug'
			]
		)
			->join('catserv')
			->where('service.is_available', 1)
			->orderBy('service.id', 'desc')
			->paginate($page)
			->get();
		$data['total_rows']	= $this->maintenance->where('service.is_available', 1)->count();
		$data['pagination']	= $this->maintenance->makePagination(
			base_url('maintenance'),
			2,
			$data['total_rows']
		);
		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/maintenance/index', $data);
		$this->load->view('layouts/_footer');
	}

	public function sortby($sort, $page = null)
	{
		$data['title']	= 'Belanja'; 
		$data['content']	= $this->maintenance->select(
			[
				'service.id', 'service.slug AS service_slug', 'service.title AS service_title',
				'service.intro AS service_intro', 'service.description', 'service.image',
				'service.price', 'service.is_available',
				'catserv.title AS catserv_title', 'catserv.slug AS catserv_slug'
			]
		)
			->join('catserv')
			->where('service.is_available', 1)
			->orderBy('service.price', $sort)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->maintenance->where('service.is_available', 1)->count();
		$data['pagination']	= $this->maintenance->makePagination(
			base_url("maintenance/sortby/$sort"),
			4,
			$data['total_rows']
		);
		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/maintenance/index', $data);
		$this->load->view('layouts/_footer');
	}

	public function catserv($catserv, $page = null)
	{
		$data['title']		= 'Belanja';
		$data['content']	= $this->maintenance->select(
			[
				'service.id', 'service.slug AS service_slug', 'service.title AS service_title',
				'service.intro AS service_intro', 'service.description', 'service.image',
				'service.price', 'service.is_available',
				'catserv.title AS catserv_title', 'catserv.slug AS catserv_slug'
			]
		)
			->join('catserv')
			->where('service.is_available', 1)
			->where('catserv.slug', $catserv)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->maintenance->where('service.is_available', 1)->where('catserv.slug', $catserv)->join('catserv')->count();
		$data['pagination']	= $this->maintenance->makePagination(
			base_url("maintenance/catserv/$catserv"),
			4,
			$data['total_rows']
		);
		$data['catserv']	= ucwords(str_replace('-', ' ', $catserv));
		
		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/maintenance/index', $data);
		$this->load->view('layouts/_footer');
	}
	
	public function subserv($subserv, $page = null)
	{
		$data['title']		= 'Belanja';
		$data['content']	= $this->maintenance->select(
			[
				'service.id', 'service.slug AS service_slug', 'service.title AS service_title',
				'service.intro AS service_intro', 'service.description', 'service.image',
				'service.price', 'service.is_available',
				'subserv.title AS subserv_title', 'subserv.slug AS subserv_slug'
			]
		)
			->join('subserv')
			->where('service.is_available', 1)
			->where('subserv.slug', $subserv)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->maintenance->where('service.is_available', 1)->where('subserv.slug', $subserv)->join('subserv')->count();
		$data['pagination']	= $this->maintenance->makePagination(
			base_url("maintenance/subserv/$subserv"),
			4,
			$data['total_rows']
		);
		$data['subserv']	= ucwords(str_replace('-', ' ', $subserv));
		
		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/maintenance/index', $data);
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
		$data['content']	= $this->maintenance->select(
			[
				'service.id', 'service.slug AS service_slug', 'service.title AS service_title',
				'service.intro AS service_intro', 'service.description', 'service.image',
				'service.price', 'service.is_available',
				'catserv.title AS catserv_title', 'catserv.slug AS catserv_slug'
			]
		)
			->join('catserv')
			->like('service.title', $keyword)
			->orLike('service.description', $keyword)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->maintenance->like('service.title', $keyword)->orLike('service.description', $keyword)->count();
		$data['pagination']	= $this->maintenance->makePagination(
			base_url('maintenance/search'),
			3,
			$data['total_rows']
		);
		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/maintenance/index', $data);
		$this->load->view('layouts/_footer');
	}

	public function detail()
	{
		$slug = $this->uri->segment(3);
		$data['title']	= $slug;
		$data['rows'] = $this->db->get_where('service', ['slug' => $slug])->row();

		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/maintenance/detail', $data);
		$this->load->view('layouts/_footer');
	}
}

/* End of file Maintenance.php */