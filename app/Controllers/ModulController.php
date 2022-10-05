<?php

namespace App\Controllers;

use App\Models\ModulsModel;

class ModulController extends BaseController
{
    public function index()
    {

        $modul = new ModulsModel();
        $show = $modul->findAll();
        $data = [
            'title' => 'Modul',
            'show' => $show
        ];
        return view('Modul', $data);
    }
}
