<?php

namespace App\Controllers;

use App\Models\CartModel;
use App\Models\ArtikelModel;
use App\Models\NotificationsModel;

helper('text');
class Home extends BaseController
{
    public function index()
    {
        $artikel = new ArtikelModel();
        $show = $artikel->findAll();
        $cartmodul = new CartModel();
        $notif = new NotificationsModel();
        $data = [
            'title' => 'Home',
            'cart' => $cartmodul->getAll(),
            'artikel' => $show,
            'notif' => $notif->notif(),
            'count' => $cartmodul->Countdata()
        ];
        return view('Home', $data);
    }

    public function detail($slug)
    {
        $cartmodul = new CartModel();
        $this->artikel = new ArtikelModel();
        $detail = $this->artikel->where(['slug' => $slug])->first();
        $data = [
            'title' => 'Artikel',
            'artikel' => $detail,
            'cart' => $cartmodul->getAll(),
            'count' => $cartmodul->Countdata()
        ];
        return view('/detailartikel', $data);
    }
}
