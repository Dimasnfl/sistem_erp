<?php

namespace App\Controllers;

use App\Models\M_sertifikat;


class Sertifikat extends BaseController
{

    function __construct()
    {
        $this->sertifikat = new M_sertifikat();
    }

    public function index()
    {
        $header['title'] = 'Data Sertifikat';
        $data['sertifikat'] = $this->sertifikat->findAll();
        // $data['pager'] = $this->sertifikat->pager;
        echo view('admin/layout/header', $header);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/sertifikat/get', $data);
        echo view('admin/layout/footer');
    }

    public function create()
    {
        $header['title'] = 'Form Tambah Data Sertifikat';

        echo view('admin/layout/header', $header);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/sertifikat/add');
        echo view('admin/layout/footer');
    }

    public function store()
    {
        $data = $this->request->getpost();

        $this->db->table('sertifikat')->insert($data);

        if ($this->db->affectedRows() > 0) {
            session()->setFlashdata('message', 'Data Sertifikat Telah Tersimpan');
            return $this->response->redirect(site_url('admin.Sertifikat'));
        }
    }

    public function edit($id = null)
    {
        if ($id != null) {
            $query = $this->db->table('sertifikat')->getWhere(['id' => $id]);
            if ($query->resultID->num_rows > 0) {
                $header['title'] = 'Form Edit Data Sertifikat';
                $data['sertifikat'] = $query->getRow();

                echo view('admin/layout/header', $header);
                echo view('admin/layout/top_menu');
                echo view('admin/layout/side_menu');
                echo view('admin/sertifikat/edit', $data);
                echo view('admin/layout/footer');
            } else {
                throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
            }
        } else {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        }
    }

    public function update($id)
    {

        $data = [
            'kode_sertifikat' => $this->request->getVar('kode_sertifikat'),
            'nama_sertifikat'  => $this->request->getVar('nama_sertifikat'),
            'harga_sertifikat'  => $this->request->getVar('harga_sertifikat'),
        ];


        $this->db->table('sertifikat')->where(['id' => $id])->update($data);
        session()->setFlashdata('message', 'Data Sertifikat Berhasil Diupdate');
        return $this->response->redirect(site_url('admin.Sertifikat'));
    }


    public function destroy($id)
    {
        $this->sertifikat->where(['id' => $id])->delete();
        session()->setFlashdata('message', 'Data Sertifikat Berhasil Dihapus');
        return $this->response->redirect(site_url('admin.Sertifikat'));
    }

    
}
