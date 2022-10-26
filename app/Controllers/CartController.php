<?php

namespace App\Controllers;

use App\Models\ModulsModel;

class CartController extends BaseController
{
    public function cart()
    {

        $data = [
            'title' => 'Cart',
            'items' => (session('cart'))
        ];
        return view('Cart', $data);
    }

    public function addtocart($id)
    {
        $modulmodel = new ModulsModel();
        $modul = $modulmodel->find($id);
        $cart = session()->get('cart', []);
        if (isset($cart[$id])) {
            return redirect()->to('/modul');
        } else {
            $cart[$id] = [
                'id' => $modul['id'],
                'quantity' => 1,
                'harga' => $modul['harga'],
                'nama' => $modul['nama'],
                'kode' => $modul['kode']
            ];
            session()->set('cart', $cart);
        }
        return redirect()->to('/cart');
    }

    public function remove($id)
    {
        $cart = session()->get('cart', []);
        unset($cart[$id]);
        session()->set('cart', $cart);
        return redirect()->to('/cart');
    }
}
