<?php

namespace App\Controllers;

use App\Models\CartModel;
use App\Models\HistoryModel;
use App\Models\NotificationsModel;

class HistoryController extends BaseController
{
    public function index()
    {
        $cartmodul = new CartModel();
        $history = new HistoryModel();
        $data = [
            'title' => 'History',
            'show' => $history->getAll(),
            'cart' => $cartmodul->getAll(),
            'count' => $cartmodul->Countdata()
        ];
        return view('history', $data);
    }
}
