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


    public function inc()
    {
        $header['title'] = 'Form Tambah Stok Modul';
        $data['moduls'] = $this->modul->getAll();

        echo view('admin/layout/header', $header);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/modul_in/add', $data);
        echo view('admin/layout/footer');
    }

    public function increase()
    {
        $data = $this->request->getpost();

        // $data = [
        //     'id_moduls' => $this->request->getVar('id_moduls'),
        //     'qty'  => $this->request->getVar('qty'),
        // ];

        $this->db->table('moduls_in')->insert($data);

        if ($this->db->affectedRows() > 0) {
            session()->setFlashdata('message', 'Stok Modul Telah Ditambahkan');
            return $this->response->redirect(site_url('admin.Modul'));
        }
    }

    public function dec()
    {
        $header['title'] = 'Form Kurangi Stok Modul';
        $data['moduls'] = $this->modul->getAll();

        echo view('admin/layout/header', $header);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/modul_in/add2', $data);
        echo view('admin/layout/footer');
    }

    public function decrease()
    {
        $data = $this->request->getpost();

        // $data = [
        //     'id_moduls' => $this->request->getVar('id_moduls'),
        //     'qty'  => $this->request->getVar('qty'),
        // ];

        $this->db->table('moduls_out')->insert($data);

        if ($this->db->affectedRows() > 0) {
            session()->setFlashdata('message', 'Stok Modul Telah Dikurangi');
            return $this->response->redirect(site_url('admin.Modul'));
        }
    }
}
