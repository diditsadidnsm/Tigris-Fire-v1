<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard_model extends MY_Model
{
    public function get_count()
    {
        $sql = "SELECT count(hits) as hits FROM visitor";
        $result = $this->db->query($sql);
        return $result->row()->hits;
    }

    public function get_where()
    {
        $date  = date("Y-m-d");
        $sql = "SELECT * FROM visitor WHERE date='".$date."' GROUP BY ip";
        $result = $this->db->query($sql);
        return $result->num_rows();
    }

    public function get_online()
    {
        $limit = time() - 100;
        $sql = "SELECT * FROM visitor WHERE online > '".$limit."'";
        $result = $this->db->query($sql);
        return $result->num_rows();
    }

    public function statistik()
	{
		$data = $this->db->query("SELECT * from visitor");
		return $data->result();
	}
}

/* End of file Dashboard_model.php */