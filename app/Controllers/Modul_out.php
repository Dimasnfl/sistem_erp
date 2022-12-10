<?php

namespace App\Controllers;

use App\Models\M_modul;
use App\Models\M_modul_in;
use App\Models\M_modul_out;
use App\Models\M_shopping_cart;


class Modul_out extends BaseController
{

    function __construct()
    {
        $this->modul = new M_modul();
        $this->modul_in = new M_modul_in();
        $this->modul_out = new M_modul_out();
        $this->shopping = new M_shopping_cart();
    }

    public function index()
    {
        $header['title'] = 'Data Transaksi';
        $data['shopping_cart'] = $this->shopping->get();

        echo view('admin/layout/header', $header);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/modul_out/get', $data);
        echo view('admin/layout/footer');
    }

    public function restore($id = null)
    {
        $this->shopping->delete($id);

        session()->setFlashdata('message', 'Data Telah Di Restore');
        return $this->response->redirect(site_url('/Modul_out'));
    }


    public function restore2()
    {
        $this->shopping->emptyTable('shopping_cart');
        session()->setFlashdata('message', 'Semua Data Telah Di Restore');
        return $this->response->redirect(site_url('admin.Modul'));
    }



    public function konfirmasi($id = null)
    {
        if ($id != null) {
            $query = $this->db->table('shopping_cart')->getWhere(['id' => $id]);
            if ($query->resultID->num_rows > 0) {
                $header['title'] = 'Detail Transaksi';
                $data['shopping_cart'] = $query->getRow();
                echo view('admin/layout/header', $header);
                echo view('admin/layout/top_menu');
                echo view('admin/layout/side_menu');
                echo view('admin/modul_out/edit', $data);
                echo view('admin/layout/footer');
            } else {
                throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
            }
        } else {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        }
    }
    public function store_konfirmasi()
    {
        $data = [
            'k_jp' => $this->request->getVar('k_jp'),
            'id_user' => $this->request->getVar('id_user'),
            'id_produk' => $this->request->getVar('id_produk'),
            'id_sertifikat' => $this->request->getVar('id_sertifikat'),
            'k_sertifikat' => $this->request->getVar('k_sertifikat'),
            'qty' => $this->request->getVar('qty'),
            'harga' => $this->request->getVar('harga'),
            'tanggal_checkout' => $this->request->getVar('tanggal_checkout')
        ];

        $this->db->table('history')->insert($data);

        if ($this->db->affectedRows() > 0) {
            session()->setFlashdata('message', 'Transaksi Telah Dikonfirmasi');
            return $this->response->redirect(site_url('/Modul_out'));
        }
    }
}
