<?php

namespace App\Controllers;

class Dashboard extends BaseController
{
    public function index()
    {
        $header['title'] = 'Dashboard';
        echo view('admin/layout.admin/header', $header);
        echo view('admin/layout.admin/top_menu');
        echo view('admin/layout.admin/side_menu');
        echo view('admin/dashboard');
        echo view('admin/layout.admin/footer');
    }
}
