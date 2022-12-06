<?php

namespace App\Controllers;

use App\Models\CartModel;

class HistoryController extends BaseController
{
    public function index()
    {
        $cartmodul = new CartModel();
        $data = [
            'title' => 'History',
            'cart' => $cartmodul->getAll(),
            'count' => $cartmodul->Countdata()
        ];
        return view('history', $data);
    }
}
