<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Home extends MY_Controller
{

	public function index($page = null)
	{

		$ip         = $this->input->ip_address(); 
        $date       = date("Y-m-d"); 
        $waktu      = time(); 
        $timeinsert = date("Y-m-d H:i:s");
        $s          = $this->db->query("SELECT * FROM visitor WHERE ip='".$ip."' AND date='".$date."'")->num_rows();
		$ss         = isset($s)?($s):0;
		
            if($ss == 0){
                $this->db->query("INSERT INTO visitor(ip, date, hits, online, time) VALUES('".$ip."','".$date."','1','".$waktu."','".$timeinsert."')");
            }
            else{
                $this->db->query("UPDATE visitor SET hits=hits+1, online='".$waktu."' WHERE ip='".$ip."' AND date='".$date."'");
            }
        $pengunjunghariini  = $this->db->query("SELECT * FROM visitor WHERE date='".$date."' GROUP BY ip")->num_rows();
        $dbpengunjung       = $this->db->query("SELECT COUNT(hits) as hits FROM visitor")->row(); 
        $totalpengunjung    = isset($dbpengunjung->hits)?($dbpengunjung->hits):0;
        $bataswaktu         = time() - 300;
		$pengunjungonline   = $this->db->query("SELECT * FROM visitor WHERE online > '".$bataswaktu."'")->num_rows();
		
        $data['pengunjunghariini'] = $pengunjunghariini;
        $data['totalpengunjung']   = $totalpengunjung;
		$data['pengunjungonline']  = $pengunjungonline;
		
		
		$data['title']	= 'Pabrikan Pembuat Alat Pemadam Kebakaran Murah';
		$data['site_desc']	= 'PT. Tigris Berkat Sejati menyediakan layanan perencanaan sistem kebakaran, pelaksanaan instalasi sistem kebakaran dan perawatan.';
		$data['site_key']	= 'jual apar murah, alat pemadam kebakaran, alat pemadam murah terdekat, jual alat pemadam murah, kebakaran, kerusakan, pemadaman';
			
		$data['content']	= $this->home->select(
			[
				'product.id', 'product.title AS product_title',
				'product.intro AS product_intro', 'product.description', 'product.image',
				'product.price', 'product.is_available',
				'category.title AS category_title', 'category.slug AS category_slug'
			]
		)
			->join('category')
			->where('product.is_available', 1)
			->paginate($page)
			->get();
		$data['total_rows']	= $this->home->where('product.is_available', 1)->count();
		$data['pagination']	= $this->home->makePagination(
			base_url('home'),
			2,
			$data['total_rows']
		);
		$this->load->view('layouts/_header', $data);
		$this->load->view('layouts/_navbar', $data);
		$this->load->view('pages/home/index', $data);
		$this->load->view('layouts/_footer');
	}

}

/* End of file Home.php */