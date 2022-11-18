<?php

namespace App\Controllers;

use App\Models\M_modul;
use App\Models\M_modul_in;
use App\Models\M_modul_out;
use App\Models\M_shopping_cart;


class Modul_out extends BaseController
{

    function __construct()
    {
        $this->modul = new M_modul();
        $this->modul_in = new M_modul_in();
        $this->modul_out = new M_modul_out();
        $this->shopping = new M_shopping_cart();
    }

    public function index()
    {
        $header['title'] = 'Transaksi Modul';
        $data['shopping_cart'] = $this->shopping->get();

        echo view('admin/layout/header', $header);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/modul_out/get', $data);
        echo view('admin/layout/footer');
    }

    public function restore($id = null)
    {
        $this->shopping->delete($id);
        session()->setFlashdata('message', 'Data Modul Telah Di Restore');
        return $this->response->redirect(site_url('/Modul_out'));
    }


    public function konfirmasi($id = null)
    {
        $this->db->table('shopping_cart')->where('id', $id)->set('konfirmasi', 1)->update();
        session()->setFlashdata('message', 'Data Modul Telah Terkonfirmasi');
        return $this->response->redirect(site_url('/Modul_out'));
    }

    public function restore2()
    {
        $this->shopping->emptyTable('shopping_cart');
        session()->setFlashdata('message', 'Semua Data Modul Telah Di Restore');
        return $this->response->redirect(site_url('admin.Modul'));
    }
}
