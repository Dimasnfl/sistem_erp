<?php

namespace App\Controllers;

use App\Models\CartModel;
use App\Models\ModulsModel;

class CartController extends BaseController
{

    function __construct()
    {
        $this->cartmodel = new CartModel();
        $this->modulmodel = new ModulsModel();
    }

    public function cart()
    {

        $data = [
            'title' => 'Cart',
            'cart' => $this->cartmodel->getAll(),
            'count' => $this->cartmodel->Countdata()
        ];
        return view('Cart', $data);
    }

    public function addtocart($id)
    {
        $cart = $this->cartmodel->getspecific($id);
        $modul = $this->modulmodel->getspecific($id);



        if ($cart) {
            if ($this->request->getVar('qty') > $modul['0']['ketersediaan']) {
                return redirect()->to('/modul');
            } else if ($this->request->getVar('qty') < 0) {
                return redirect()->to('/modul');
            } else {
                $data = [
                    'qty' => $cart['0']['qty'] + $this->request->getVar('qty'),
                    'harga' => $cart['0']['harga'] + ($modul['0']['harga_modul'] * $this->request->getVar('qty'))
                ];
                $this->cartmodel->updatedata($id, $data);
                $data2 = [
                    'ketersediaan' => $modul['0']['ketersediaan'] - $this->request->getVar('qty')
                ];
                $this->modulmodel->updatedata($id, $data2);
                return redirect()->to('/modul');
            }
        } else {
            if ($this->request->getVar('qty') > $modul['0']['ketersediaan']) {
                return redirect()->to('/modul');
            } else {
                $data = [
                    'id_user' => session('nim'),
                    'id_produk' => $id,
                    'qty' => $this->request->getVar('qty'),
                    'harga' => $modul['0']['harga_modul'] * $this->request->getVar('qty')
                ];
                $data2 = [
                    'ketersediaan' => $modul['0']['ketersediaan'] - $this->request->getVar('qty')
                ];
                $this->modulmodel->updatedata($id, $data2);
                $this->cartmodel->insert($data);
                return redirect()->to('/cart');
            }
        }

        // $cart = session()->get('cart', []);
        // if (isset($cart[$id])) {
        //     return redirect()->to('/modul');
        // } else {
        //     $cart[$id] = [
        //         'id' => $modul['id'],
        //         'quantity' => 1,
        //         'harga' => $modul['harga'],
        //         'nama' => $modul['nama'],
        //         'kode' => $modul['kode']
        //     ];
        //     session()->set('cart', $cart);
        // }

    }

    public function updatecart()
    {
        # code...
    }

    public function remove($id)
    {
        $modulmodel = new ModulsModel();
        $cartmodel = new CartModel();
        $modul = $modulmodel->getspecific($id);
        $cart = $cartmodel->getspecific($id);
        if ($cart) {
            $data = [
                'ketersediaan' =>  $modul['0']['ketersediaan'] + $cart['0']['qty']
            ];
            $this->modulmodel->updatedata($id, $data);
            $this->cartmodel->deletedata($id);
            return redirect()->to('/cart');
        }
    }

    public function Checkout()
    {
        # code...
    }
}
