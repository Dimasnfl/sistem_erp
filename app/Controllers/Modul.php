<?php

namespace App\Controllers;

use App\Models\M_listmodul;
use App\Models\M_modul;
use App\Models\M_modul_in;

helper('form');


class Modul extends BaseController
{

    function __construct()
    {
        $this->listmodul = new M_listmodul();
        $this->modul = new M_modul();
        $this->modul_in = new M_modul_in();
    }

    public function index()
    {
        $header['title'] = 'Data Modul';
        
        $keyword = $this->request->getGet('keyword');

        $data['moduls'] = $this->modul->get($keyword);
        echo view('layout/header', $header);
        echo view('layout/top_menu');
        echo view('layout/side_menu');
        echo view('modul/get', $data);
        echo view('layout/footer');
    }

    //FUNCTION ADD MODUL 1
    public function create()
    {
        $header['title'] = 'Form Tambah Data Modul';

        echo view('layout/header', $header);
        echo view('layout/top_menu');
        echo view('layout/side_menu');
        echo view('modul/add');
        echo view('layout/footer');
    }



    //FUNCTION ADD MODUL 2
    public function store()
    {
        $data = $this->request->getpost();

        // $data = [
        //     'kode' => $this->request->getVar('kode'),
        //     'nama'  => $this->request->getVar('nama'),
        //     'harga'  => $this->request->getVar('harga'),
        // ];

        $this->db->table('moduls')->insert($data);

        if ($this->db->affectedRows() > 0) {
            session()->setFlashdata('message', 'Data Modul Telah Tersimpan');
            return $this->response->redirect(site_url('/Modul'));
        }
    }


    //FUNCTION EDIT MODUL 1
    public function edit($id = null)
    {
        if ($id != null) {
            $query = $this->db->table('moduls')->getWhere(['id' => $id]);
            if ($query->resultID->num_rows > 0) {
                $header['title'] = 'Form Edit Modul';
                $data['moduls'] = $query->getRow();

                echo view('layout/header', $header);
                echo view('layout/top_menu');
                echo view('layout/side_menu');
                echo view('modul/edit', $data);
                echo view('layout/footer');
            } else {
                throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
            }
        } else {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        }
    }
    //FUNCTION EDIT MODUL 2
    public function update($id)
    {
        //if data is array = don't need to use "unset"
        // $data = $this->request->getPost();
        // unset($data['_method']);
                $data = [
            'kode_modul' => $this->request->getVar('kode_modul'),
            'nama_modul'  => $this->request->getVar('nama_modul'),
            'harga_modul'  => $this->request->getVar('harga_modul'),
        ];


        $this->db->table('moduls')->where(['id' => $id])->update($data);
        session()->setFlashdata('message', 'Data Modul Berhasil Diupdate');
        return $this->response->redirect(site_url('/Modul'));
    }

    //FUNCTION DELETE MODUL
    public function destroy($id)
    {
        $this->modul->where(['id' => $id])->delete();
        session()->setFlashdata('message', 'Data Modul Berhasil Dihapus');
        return $this->response->redirect(site_url('/Modul'));
    }

    //FUNCTION IMPORT MODUL
    public function import()
    {
        $file = $this->request->getFile('file_excel');
        $extension = $file->getClientExtension();
        if ($extension == 'xlsx' || $extension == 'xls') {
            if ($extension == 'xls') {
                $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
            } else {
                $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
            }
            $spreadsheet = $reader->load($file);
            $moduls = $spreadsheet->getActiveSheet()->toArray();
            foreach ($moduls as $key => $value) {
                if ($key == 0) {
                    continue;
                }
                $data = [
                    'kode_modul' => $value[1],
                    'nama_modul' => $value[2],
                    'harga_modul' => $value[3],
                ];
                $this->db->table('moduls')->insert($data);
            }

            session()->setFlashdata('message', 'File Excel Berhasil Diimport');
            return $this->response->redirect(site_url('/Modul'));
        } else {
            session()->setFlashdata('message', 'File Excel Tidak Sesuai');
            return $this->response->redirect(site_url('/Modul'));
        }
    }
}
