<?php

namespace App\Controllers;

use App\Models\M_modul;
use App\Models\M_modul_in;
use App\Models\M_modul_out;
use App\Models\M_shopping_cart;


class Laporan extends BaseController
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
        $header['title'] = 'Laporan Transaksi';
        $data['laporan'] = $this->shopping->get();

        echo view('admin/layout/header', $header);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/modul_out/laporan', $data);
        echo view('admin/layout/footer');
    }


}
