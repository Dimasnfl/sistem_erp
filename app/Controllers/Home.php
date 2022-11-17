<?php

namespace App\Controllers;

use App\Models\CartModel;

class Home extends BaseController
{
    public function index()
    {
        $cartmodul = new CartModel();
        $data = [
            'title' => 'Home',
            'cart' => $cartmodul->getAll(),
            'count' => $cartmodul->Countdata()
        ];
        return view('Home', $data);
    }
}
