<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller 
{

	private $id;

	public function __construct()
	{
		parent::__construct();
		$is_login	= $this->session->userdata('is_login');
		$this->id	= $this->session->userdata('id');

		if (! $is_login) {
			redirect(base_url());
			return;
		}
	}

	public function index()
	{
        $data['title'] = 'Dashboard Member Tigris Fire';
        
		$data['activity'] = $this->db->get('user')->num_rows();
		$data['product']  = $this->db->get('product')->num_rows();
		$data['orders']   = $this->db->get('orders')->num_rows();
		
		$this->load->view('user/material/nam_header', $data);
		$this->load->view('user/material/nam_navbar', $data);
		$this->load->view('user/material/nam_layout');
		$this->load->view('user/material/nam_sidebar');
		$this->load->view('user/nam_dashboard');
		$this->load->view('user/material/nam_footer');
	}

}

/* End of file Dashboard.php */
