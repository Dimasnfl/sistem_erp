<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\ArtikelModel;
use Config\Services;
use Faker\Extension\Helper;

helper('form');
helper('text');
class Artikel extends BaseController
{

    public function index()
    {
        $artikel = new ArtikelModel();
        $show = $artikel->findAll();


        $data = [
            'title' => 'ERP | Artikel',
            'artikel' => $show
        ];
        echo view('admin/layout/header', $data);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/artikel/index', $data);
        echo view('admin/layout/footer');
    }

    public function create()
    {
        $datas = new ArtikelModel();
        $jurusans = $datas->findAll();
        $data = [
            'title' => 'ERP | Tambah Artikel',
            'validation' => Services::validation(),
            'artikel' => $jurusans
        ];
        echo view('admin/layout/header', $data);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        return view('admin/artikel/add', $data);
        echo view('admin/layout/footer');
    }

    public function save()
    {
        // dd($this->request->getVar());
        $rules = [
            'judul' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Judul Harus Diisi'
                ]
            ],
            'body' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Isi Artikel Harus Diisi'
                ]
            ],

        ];

        if (!$this->validate($rules)) {
            return redirect()->back()->withInput()->with('error', $this->validator->listErrors());
        }
        $filefoto = $this->request->getFile('img');

        //get foto
        $filefoto->move('img/artikel');
        $filename = $filefoto->getName();

        $artikel = new ArtikelModel();
        $slug = url_title($this->request->getVar('judul'), '-', true);
        $artikel->save([
            'judul' => $this->request->getVar('judul'),
            'slug' => $slug,
            'body' => $this->request->getVar('body'),
            'img' => $filename
        ]);
        session()->setFlashdata('berhasil', 'Artikel berhasil diposting');
        return redirect()->to('admin.artikel');
    }
    public function delete($id)
    {

        $this->artikel = new ArtikelModel();
        $foto = $this->artikel->find($id);
        unlink('img/artikel/' . $foto->img);

        $this->artikel->where(['id' => $id])->delete();
        session()->setFlashdata('sukses', 'Artikel berhasil dihapus');
        return redirect()->to('admin.artikel');
    }

    public function edit($slug)
    {
        $this->model = new ArtikelModel();
        $data = [
            'title' => 'Form Edit Artikel',
            'validation' => \config\Services::validation(),
            'artikel' => $this->model->getArtikel($slug)
        ];
        echo view('admin/layout/header', $data);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        return view('admin/artikel/edit', $data);
        echo view('admin/layout/footer');
    }
    public function update($id)
    {
        $rules = [
            'judul' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Judul Harus Diisi'
                ]
            ],
            'body' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Isi Artikel Harus Diisi'
                ]
            ]

        ];
        if (!$this->validate($rules)) {
            return redirect()->back()->withInput()->with('error', $this->validator->listErrors());
        }
        $filefoto = $this->request->getFile('img');
        if ($filefoto->getError() == 4) {
            $filename = $this->request->getVar('imglama');
        } else {
            $filefoto->move('img/artikel');
            unlink('img/artikel/' . $this->request->getVar('imglama'));
            $filename = $filefoto->getName();
        }

        $artikel = new ArtikelModel();
        $slug = url_title($this->request->getVar('judul'), '-', true);
        //dd($this->request->getVar());
        $artikel->save([
            'id' => $id,
            'judul' => $this->request->getVar('judul'),
            'slug' => $slug,
            'body' => $this->request->getVar('body'),
            'img' => $filename
        ]);
        session()->setFlashdata('updated', 'Artikel berhasil diupdate');
        return redirect()->to('admin.artikel');
    }
}
