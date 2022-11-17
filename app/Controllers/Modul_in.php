<?php

namespace App\Controllers;

use App\Models\M_modul;
use App\Models\M_modul_in;
use App\Models\M_modul_out;


helper('form');


class Modul_in extends BaseController
{

    function __construct()
    {
        $this->modul = new M_modul();
        $this->modul_in = new M_modul_in();
        $this->modul_out = new M_modul_out();

    }


    public function create()
    {
        $header['title'] = 'Form Tambah Stok Modul';
        $data['moduls'] = $this->modul->getAll();

        echo view('layout/header', $header);
        echo view('layout/top_menu');
        echo view('layout/side_menu');
        echo view('modul_in/add', $data);
        echo view('layout/footer');
    }

    public function store()
    {
        $data = $this->request->getpost();

        // $data = [
        //     'id_moduls' => $this->request->getVar('id_moduls'),
        //     'qty'  => $this->request->getVar('qty'),
        // ];

        $this->db->table('moduls_in')->insert($data);

        if ($this->db->affectedRows() > 0) {
            session()->setFlashdata('message', 'Stok Modul Telah Ditambahkan');
            return $this->response->redirect(site_url('/Modul'));
        }
    }
}
