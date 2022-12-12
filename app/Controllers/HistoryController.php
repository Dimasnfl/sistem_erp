<?php

namespace App\Controllers;

use App\Models\CartModel;
use App\Models\HistoryModel;

class HistoryController extends BaseController
{
    public function index()
    {
        $cartmodul = new CartModel();
        $history = new HistoryModel();
        $notif = new NotificationsModel();
        $data = [
            'title' => 'History',
            'show' => $history->getAll(),
            'cart' => $cartmodul->getAll(),
            'notif' => $notif->notif(),
            'count' => $cartmodul->Countdata()
        ];
        return view('history', $data);
    }
}
