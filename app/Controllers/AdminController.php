<?php

namespace App\Controllers;

class AdminController extends BaseController
{
    public function index()
    {
        $data = [
            'title' => 'admin'
        ];
        return view('Admin', $data);
    }
}
