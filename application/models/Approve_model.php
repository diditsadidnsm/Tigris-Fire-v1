<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Approve_model extends MY_Model
{

    // protected $perPage = 5;

    public function getDefaultValues()
    {
        return [
            'first_name'  => '',
            'last_name'   => '',
            'service'     => '',
            'telp'        => '',
            'date'        => '',
            'time'        => '',
            'message'     => ''
        ];
    }

    public function getValidationRules()
    {
        $validationRules = [
            [
                'field'    => 'first_name',
                'label'    => 'Nama Depan',
                'rules'    => 'required'
            ],
            [
                'field'    => 'last_name',
                'label'    => 'Nama Belakang',
                'rules'    => 'required'
            ],
            [
                'field'    => 'service',
                'label'    => 'Layanan',
                'rules'    => 'trim|required'
            ],
            [
                'field'    => 'telp',
                'label'    => 'Telepon',
                'rules'    => 'trim|required|numeric'
            ],
            [
                'field'    => 'date',
                'label'    => 'Tanggal',
                'rules'    => 'trim|required'
            ],
            [
                'field'    => 'time',
                'label'    => 'Waktu',
                'rules'    => 'trim|required'
            ],
            [
                'field'    => 'message',
                'label'    => 'Pesan',
                'rules'    => 'required'
            ],
        ];

        return $validationRules;
    }
}

/* End of file Approve_model.php */