<?php

namespace App\Controllers;

use App\Models\M_listmodul;
use App\Models\M_modul;

class ListModul extends BaseController
{

    function __construct()
    {
        $this->listmodul = new M_listmodul();
        $this->modul = new M_modul();
    }

    public function index()
    {
        $header['title'] = 'Data Modul';

        //cara 1
        // $builder = $this->db->table('moduls');
        // $query   = $builder->get();

        // $data['moduls'] = $query->getResult();

        //cara2
        // $M_modul= new M_modul();
        // $data['modul'] = $M_modul->orderBy('kode', 'ASC')->findAll();

        //cara 3
        // $query = $this->db->query("SELECT * FROM list_modul");
        // $data['list_modul'] = $query->getResult();

        //cara 4
        $data['list_modul'] = $this->listmodul->getAll();


        echo view('layout/header', $header);
        echo view('layout/top_menu');
        echo view('layout/side_menu');
        echo view('list_modul/get', $data);
        echo view('layout/footer');
    }


    //FUNCTION ADD 1
    public function create()
    {
        $header['title'] = 'Form Tambah Modul';
        $data['moduls'] = $this->modul->getAll();

        echo view('layout/header', $header);
        echo view('layout/top_menu');
        echo view('layout/side_menu');
        echo view('list_modul/add', $data);
        echo view('layout/footer');
    }
    //FUNCTION ADD 2
    public function store()
    {
        $data = $this->request->getpost();

        // $data = [
        //     'kode' => $this->request->getVar('kode'),
        //     'nama'  => $this->request->getVar('nama'),
        //     'harga'  => $this->request->getVar('harga'),
        // ];

        $this->listmodul->insert($data);

        if ($this->db->affectedRows() > 0) {
            session()->setFlashdata('message', 'List Modul Telah Tersimpan');
            return $this->response->redirect(site_url('/ListModul'));
        }
    }

    //FUNCTION EDIT 1
    public function edit($id = null)
    {
        if ($id != null) {
            $query = $this->db->table('list_modul')->getWhere(['id' => $id]);
            if ($query->resultID->num_rows > 0) {
                $header['title'] = 'Form Edit List Modul';
                $data['list_modul'] = $query->getRow();

                echo view('layout/header', $header);
                echo view('layout/top_menu');
                echo view('layout/side_menu');
                echo view('list_modul/edit', $data);
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

        $this->db->table('list_modul')->where(['id' => $id])->update($data);
        session()->setFlashdata('message', 'List Modul Berhasil Diupdate');
        return $this->response->redirect(site_url('/ListModul'));
    }


    //FUNCTION DELETE
    public function destroy($id)
    {
        $this->listmodul->delete($id);
        session()->setFlashdata('message', 'List Modul Berhasil Dihapus');
        return $this->response->redirect(site_url('/ListModul'));
    }


    //FUNCTION IMPORT 
    // public function import()
    // {
    //     $file = $this->request->getFile('file_excel');
    //     $extension = $file->getClientExtension();
    //     if ($extension == 'xlsx' || $extension == 'xls') {
    //         if ($extension == 'xls') {
    //             $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
    //         } else {
    //             $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
    //         }
    //         $spreadsheet = $reader->load($file);
    //         $moduls = $spreadsheet->getActiveSheet()->toArray();
    //         foreach ($moduls as $key => $value) {
    //             if ($key == 0) {
    //                 continue;
    //             }
    //             $data = [
    //                 'kode' => $value[1],
    //                 'nama' => $value[2],
    //             ];
    //             $this->db->table('moduls')->insert($data);
    //         }

    //         session()->setFlashdata('message', 'File Excel Berhasil Diimport');
    //         return $this->response->redirect(site_url('/Modul'));
    //     } else {
    //         session()->setFlashdata('message', 'File Excel Tidak Sesuai');
    //         return $this->response->redirect(site_url('/Modul'));
    //     }
    // }
}
