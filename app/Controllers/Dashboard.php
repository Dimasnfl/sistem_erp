<?php
namespace App\Controllers;
class Dashboard extends BaseController
{
    public function index()
    {
        $header['title']='Dashboard';
        echo view('layout/header',$header);
        echo view('layout/top_menu');
        echo view('layout/side_menu');
        echo view('dashboard');
        echo view('layout/footer');
    }
}