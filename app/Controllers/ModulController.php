<?php

namespace App\Controllers;

use App\Models\CartModel;
use App\Models\ModulsModel;
use CodeIgniter\HTTP\Request;
use App\Models\NotificationsModel;

class ModulController extends BaseController
{
    public function index()
    {

        $modul = new ModulsModel();
        $cartmodul = new CartModel();
        $notif = new NotificationsModel();
        $show = $modul->findAll();
        $data = [
            'title' => 'Modul',
            'show' => $show,
            'cart' => $cartmodul->getAll(),
            'notif' => $notif->notif(),
            'count' => $cartmodul->Countdata()
        ];
        return view('Modul', $data);
    }
}
