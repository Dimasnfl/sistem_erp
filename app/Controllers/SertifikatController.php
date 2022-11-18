<?php

namespace App\Controllers;

use App\Database\Migrations\NilaiSertifikat;
use App\Models\CartModel;
use App\Models\Nilai_SertifikatModel;

class SertifikatController extends BaseController
{
    public function index()
    {
        $cartmodul = new CartModel();
        $nilaimodul = new Nilai_SertifikatModel();
        $data = [
            'title' => 'Sertifikat',
            'cart' => $cartmodul->getAll(),
            'count' => $cartmodul->Countdata(),
            'nilai' => $nilaimodul->getAll(),
            'session' => session()
        ];
        return view('Sertifikat', $data);
    }

    public function addsertifikat($id)
    {
        $nilaimodul = new Nilai_SertifikatModel();
        $cartmodul = new CartModel();
        $nilai = $nilaimodul->getspecific($id);
        $cart = $cartmodul->getspecific2($id);

        if ($cart) {
            return redirect()->to('/sertifikat');
        } else {
            $data = [
                'id_user' => session('nim'),
                'id_sertifikat' => $id,
                'qty' => 1,
                'harga' => $nilai['0']['harga_sertifikat']
            ];
            $cartmodul->insert($data);
            return redirect()->to('/cart');
        }
    }

    public function removesertifikat($id)
    {
        $cartmodul = new Nilai_SertifikatModel();
        $cartmodul->deletedata($id);
        return redirect()->to('/cart');
    }
}
