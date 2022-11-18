<?php

namespace App\Controllers;

use App\Models\M_modul;
use App\Models\M_modul_in;
use App\Models\M_modul_out;


class Modul_out extends BaseController
{

    function __construct()
    {
        $this->modul = new M_modul();
        $this->modul_in = new M_modul_in();
        $this->modul_out = new M_modul_out();
    }

    public function index()
    {
        $header['title'] = 'Transaksi Modul';
        $data['modul_out'] = $this->modul_out->getProcess();

        echo view('admin/layout/header', $header);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/modul_out/get', $data);
        echo view('admin/layout/footer');
    }

    public function restore($id = null)
    {
        $this->modul_out->delete($id);
        session()->setFlashdata('message', 'Data Modul Telah Di Restore');
        return $this->response->redirect(site_url('/Modul_out'));
    }

    public function restore2()
    {
        $this->modul_out->emptyTable('moduls_out');
        session()->setFlashdata('message', 'Semua Data Modul Telah Di Restore');
        return $this->response->redirect(site_url('admin.Modul'));
    }
}
