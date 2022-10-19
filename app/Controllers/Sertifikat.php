<?php

namespace App\Controllers;

// use App\Models\M_modul;
// use CodeIgniter\Controller;

class Sertifikat extends BaseController
{
    public function index()
    {
        $header['title'] = 'Data Sertifikat';

        $builder = $this->db->table('sertifikat');
        $query   = $builder->get();

        $data['sertifikat'] = $query->getResult();

        echo view('layout/header', $header);
        echo view('layout/top_menu');
        echo view('layout/side_menu');
        echo view('sertifikat/get', $data);
        echo view('layout/footer');
    }

    //FUNCTION ADD 1
    public function create()
    {
        $header['title'] = 'Form Tambah Sertifikat';

        echo view('layout/header', $header);
        echo view('layout/top_menu');
        echo view('layout/side_menu');
        echo view('sertifikat/add');
        echo view('layout/footer');
    }
    //FUNCTION ADD 2
    public function store()
    {
        $data = $this->request->getpost();

        $this->db->table('sertifikat')->insert($data);

        if ($this->db->affectedRows() > 0) {
            session()->setFlashdata('message', 'Data Sertifikat Telah Tersimpan');
            return $this->response->redirect(site_url('/Sertifikat'));
        }
    }

    //FUNCTION EDIT 1
    public function edit($id = null)
    {
        if ($id != null) {
            $query = $this->db->table('sertifikat')->getWhere(['id' => $id]);
            if ($query->resultID->num_rows > 0) {
                $header['title'] = 'Form Edit Sertifikat';
                $data['sertifikat'] = $query->getRow();

                echo view('layout/header', $header);
                echo view('layout/top_menu');
                echo view('layout/side_menu');
                echo view('sertifikat/edit', $data);
                echo view('layout/footer');
            } else {
                throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
            }
        } else {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound();
        }
    }
    //FUNCTION EDIT 2
    public function update($id)
    {
        //if data is array = don't need to use "unset"
        $data = $this->request->getPost();
        unset($data['_method']);

        $this->db->table('sertifikat')->where(['id' => $id])->update($data);
        session()->setFlashdata('message', 'Data Sertifikat Berhasil Diupdate');
        return $this->response->redirect(site_url('/Sertifikat'));
    }

    //FUNCTION DELETE
    public function destroy($id)
    {
        $this->db->table('sertifikat')->where(['id' => $id])->delete();
        session()->setFlashdata('message', 'Data Sertifikat Berhasil Dihapus');
        return $this->response->redirect(site_url('/Sertifikat'));
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
            $sertifikat = $spreadsheet->getActiveSheet()->toArray();
            foreach ($sertifikat as $key => $value) {
                if ($key == 0) {
                    continue;
                }
                $data = [
                    // 'kode' => $value[1],
                    // 'nama' => $value[2],
                    // 'harga' => $value[3],
                ];
                $this->db->table('sertifikat')->insert($data);
            }

            session()->setFlashdata('message', 'File Excel Berhasil Diimport');
            return $this->response->redirect(site_url('/Sertifikat'));
        } else {
            session()->setFlashdata('message', 'File Excel Tidak Sesuai');
            return $this->response->redirect(site_url('/Sertifikat'));
        }
    }
}
