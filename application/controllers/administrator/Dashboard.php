<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends MY_Controller
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

	public function index()
	{
        $data['title'] = 'Dashboard Administrator Tigris Fire';
        
        $data['visitorTotal']  = $this->dashboard->get_count(); 
		$data['activity'] = $this->db->get('user')->num_rows();
		$data['product']  = $this->db->get('product')->num_rows();
		$data['orders']   = $this->db->get('orders')->num_rows();
		$data['statistik'] = $this->dashboard->statistik();
		
		$this->load->view('administrator/material/nsm_header', $data);
		$this->load->view('administrator/material/nsm_navbar', $data);
		$this->load->view('administrator/material/nsm_layout');
		$this->load->view('administrator/material/nsm_sidebar');
		$this->load->view('administrator/nsm_dashboard');
		$this->load->view('administrator/material/nsm_footer');
	}
    
}

/* End of file Dashboard.php */