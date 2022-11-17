<?php

namespace App\Controllers;

use App\Models\CartModel;
use App\Models\ModulsModel;
use CodeIgniter\HTTP\Request;

class ModulController extends BaseController
{
    public function index()
    {

        $modul = new ModulsModel();
        $cartmodul = new CartModel();
        $show = $modul->findAll();
        $data = [
            'title' => 'Modul',
            'show' => $show,
            'cart' => $cartmodul->getAll(),
            'count' => $cartmodul->Countdata()
        ];
        return view('Modul', $data);
    }
}
