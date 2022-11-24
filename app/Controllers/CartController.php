<?php

namespace App\Controllers;

use App\Models\CartModel;
use App\Models\ModulsModel;
use CodeIgniter\I18n\Time;
use DateTime;

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

    public function add()
    {
        $modulmodel = new ModulsModel();
        $cart = new CartModel();
        $count = $modulmodel->count();
        $modul = $modulmodel->getall();
        $qty = $this->request->getVar('qty');

        // dd($modul);

        for ($i = 0; $i < $count; $i++) {
            $id = $modul[$i]['kode_modul'];
            $validasi = $cart->get1($id);
            $data = [
                'id_user' => session('nim'),
                'id_produk' => $modul[$i]['kode_modul'],
                'qty' => $qty[$i],
                'harga' => (int)$modul[$i]['harga_modul']
            ];
            $data2 = [
                'ketersediaan' => (int)$modul[$i]['ketersediaan'] - (int)$qty[$i]
            ];
            if ($validasi) {
            } else {
                if ($data['qty'] < 0) {
                } else {
                    $modulmodel->update($modul[$i], $data2);
                    $cart->insert($data);
                }
            }
        }
        return redirect()->to('/cart');
    }

    // public function addtocart($id)
    // {
    //     $cart = $this->cartmodel->getspecific($id);
    //     $modul = $this->modulmodel->getspecific($id);



    //     if ($cart) {
    //         if ($this->request->getVar('qty') > $modul['0']['ketersediaan']) {
    //             return redirect()->to('/modul');
    //         } else if ($this->request->getVar('qty') < 0) {
    //             return redirect()->to('/modul');
    //         } else {
    //             $data = [
    //                 'qty' => $cart['0']['qty'] + $this->request->getVar('qty'),
    //                 'harga' => $cart['0']['harga'] + ($modul['0']['harga_modul'] * $this->request->getVar('qty'))
    //             ];
    //             $this->cartmodel->updatedata($id, $data);
    //             $data2 = [
    //                 'ketersediaan' => $modul['0']['ketersediaan'] - $this->request->getVar('qty')
    //             ];
    //             $this->modulmodel->updatedata($id, $data2);
    //             return redirect()->to('/modul');
    //         }
    //     } else {
    //         if ($this->request->getVar('qty') > $modul['0']['ketersediaan']) {
    //             return redirect()->to('/modul');
    //         } else {
    //             $data = [
    //                 'id_user' => session('nim'),
    //                 'id_produk' => $id,
    //                 'qty' => $this->request->getVar('qty'),
    //                 'harga' => $modul['0']['harga_modul'] * $this->request->getVar('qty')
    //             ];
    //             $data2 = [
    //                 'ketersediaan' => $modul['0']['ketersediaan'] - $this->request->getVar('qty')
    //             ];
    //             $this->modulmodel->updatedata($id, $data2);
    //             $this->cartmodel->insert($data);
    //             return redirect()->to('/cart');
    //         }
    //     }

    //     // $cart = session()->get('cart', []);
    //     // if (isset($cart[$id])) {
    //     //     return redirect()->to('/modul');
    //     // } else {
    //     //     $cart[$id] = [
    //     //         'id' => $modul['id'],
    //     //         'quantity' => 1,
    //     //         'harga' => $modul['harga'],
    //     //         'nama' => $modul['nama'],
    //     //         'kode' => $modul['kode']
    //     //     ];
    //     //     session()->set('cart', $cart);
    //     // }

    // }

    public function updatecart()
    {

        $modulmodel = new ModulsModel();
        $cartmodel = new CartModel();
        $qty = $this->request->getVar('qty');
        $id_produk = $this->request->getVar('id');
        $modul = $modulmodel->getspecific($id_produk);
        $cart = $cartmodel->getspecific($id_produk);
        if ($qty > $modul['0']['ketersediaan']) {
        } else {
            $data = [
                'ketersediaan' =>  $modul['0']['ketersediaan'] - ($qty - $cart['0']['qty'])
            ];
            $this->modulmodel->updatedata($id_produk, $data);
            echo json_encode($cartmodel->updatecart($id_produk, $qty));
        }
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
        $date = new Time('now');
        $cartmodel = new CartModel();
        $data = [
            'tanggal_checkout' => $date
        ];
        $cartmodel->getiduser($data);
        return redirect()->to('/cart');
    }
}
