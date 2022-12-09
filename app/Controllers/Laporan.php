<?php

namespace App\Controllers;

use App\Models\M_modul;
use App\Models\M_sertifikat;
use App\Models\M_modul_in;
use App\Models\M_modul_out;
use App\Models\HistoryModel;
use App\Models\JurusanModel;



class Laporan extends BaseController
{

    function __construct()
    {
        $this->modul = new M_modul();
        $this->sertifikat = new M_sertifikat();
        $this->modul_in = new M_modul_in();
        $this->modul_out = new M_modul_out();
        $this->history = new HistoryModel();
        $this->jurusan = new JurusanModel();


    }

    public function index()
    {
        $header['title'] = 'Laporan Transaksi';


        //data filter
        $data['filter_modul'] = $this->modul->findAll();
        $data['filter_jurusan'] = $this->jurusan->findAll();
        $data['filter_sertifikat'] = $this->sertifikat->findAll();

        $from = $this->request->getGet('from');
        $to = $this->request->getGet('to');

        $data['laporan'] = $this->history->laporan($from, $to);

        echo view('admin/layout/header', $header);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/modul_out/laporan', $data);
        echo view('admin/layout/footer');
    }


}
