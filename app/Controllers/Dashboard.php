<?php
namespace App\Controllers;

use App\Models\M_listmodul;
use App\Models\M_modul;



class Dashboard extends BaseController
{

    function __construct()
    {
        $this->listmodul = new M_listmodul();
        $this->modul = new M_modul();


    }

    public function index()
    {

        // $modul_per_kategori = $this->listmodul->select('COUNT(list_modul.id_list) AS jumlah, moduls.nama_modul')
        // ->join('moduls','list_modul.id_modul=moduls.id')
        // ->groupBy('list_modul.id_modul')
        // ->where('deleted_at', NULL)
        // ->get();

        $sum_modul= $this->db->table('moduls')->selectSum('ketersediaan')
        ->get();
     

        $modul_per_kategori = $this->db->table('moduls')->select('ketersediaan AS jumlah, moduls.nama_modul')
        ->get();


        $header['title']='Dashboard';
        echo view('layout/header',$header);
        echo view('layout/top_menu');
        echo view('layout/side_menu');
        echo view('dashboard',[
            'modul_per_kategori' => $modul_per_kategori,
            'sum_modul' => $sum_modul,
        ]);
    }

}