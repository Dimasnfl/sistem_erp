<?php
namespace App\Controllers;

use App\Models\M_listmodul;


class Dashboard extends BaseController
{

    function __construct()
    {
        $this->listmodul = new M_listmodul();

    }

    public function index()
    {

        $modul_per_kategori = $this->listmodul->select('COUNT(list_modul.id) AS jumlah, moduls.nama AS nama')
        ->join('moduls','list_modul.id_modul=moduls.id')
        ->groupBy('list_modul.id_modul')
        ->get();


        $header['title']='Dashboard';
        echo view('layout/header',$header);
        echo view('layout/top_menu');
        echo view('layout/side_menu');
        echo view('dashboard',[
            'modul_per_kategori' => $modul_per_kategori,
        ]);
    }

}