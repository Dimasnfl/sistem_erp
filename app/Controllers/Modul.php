<?php

namespace App\Controllers;

use App\Models\M_listmodul;
use App\Models\M_modul;

class Modul extends BaseController
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
        // $query = $this->db->query("SELECT * FROM moduls");
        // $data['moduls'] = $query->getResult();


        //cara 4
        // $data['moduls'] = $this->modul->getAll();
        $data['moduls'] = $this->modul->getStok();

        echo view('admin/layout.admin/header', $header);
        echo view('admin/layout.admin/top_menu');
        echo view('admin/layout.admin/side_menu');
        echo view('admin/modul/get', $data);
        echo view('admin/layout.admin/footer');
    }

    //FUNCTION ADD MODUL 1
    public function create()
    {
        $header['title'] = 'Form Tambah Modul';

        echo view('admin/layout.admin/header', $header);
        echo view('admin/layout.admin/top_menu');
        echo view('admin/layout.admin/side_menu');
        echo view('admin/modul/add');
        echo view('admin/layout.admin/footer');
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
            return $this->response->redirect(site_url('admin.modul'));
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

                echo view('admin/layout.admin/header', $header);
                echo view('admin/layout.admin/top_menu');
                echo view('admin/layout.admin/side_menu');
                echo view('admin/modul/edit', $data);
                echo view('admin/layout.admin/footer');
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
        $data = $this->request->getPost();
        unset($data['_method']);

        $this->db->table('moduls')->where(['id' => $id])->update($data);
        session()->setFlashdata('message', 'Data Modul Berhasil Diupdate');
        return $this->response->redirect(site_url('admin.modul'));
    }

    //FUNCTION DELETE MODUL
    public function destroy($id)
    {
        $this->modul->where(['id' => $id])->delete();
        session()->setFlashdata('message', 'Data Modul Berhasil Dihapus');
        return $this->response->redirect(site_url('admin.modul'));
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
                    'kode' => $value[1],
                    'nama' => $value[2],
                    'harga' => $value[3],
                ];
                $this->db->table('moduls')->insert($data);
            }

            session()->setFlashdata('message', 'File Excel Berhasil Diimport');
            return $this->response->redirect(site_url('admin.modul'));
        } else {
            session()->setFlashdata('message', 'File Excel Tidak Sesuai');
            return $this->response->redirect(site_url('admin.modul'));
        }
    }
}
