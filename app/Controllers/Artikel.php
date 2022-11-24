<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\ArtikelModel;
use Config\Services;
use App\Models\CartModel;
use App\Models\ModulsModel;
use Faker\Extension\Helper;

class Artikel extends BaseController
{
    protected $helpers = ['form'];
    public function index()
    {
        $artikel = new ArtikelModel();
        $show = $artikel->findAll();
        $data = [
            'title' => 'Artikel',
            'artikel' => $show
        ];
        echo view('admin/layout.admin/header', $data);
        echo view('admin/layout.admin/top_menu');
        echo view('admin/layout.admin/side_menu');
        echo view('admin/artikel/index', $data);
        echo view('admin/layout.admin/footer');
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
        echo view('admin/layout.admin/header', $data);
        echo view('admin/layout.admin/top_menu');
        echo view('admin/layout.admin/side_menu');
        return view('admin/artikel/add', $data);
        echo view('admin/layout.admin/footer');
    }

    public function save()
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
            ],

            'img' => [
                'rules' => 'required|max_size[img,1024]|is_image[img]|mime_in[img,image/jpg, image/jpeg, image/png]',
                'errors' => [
                    'required' => 'Pilih Gambar yang akan diunggah',
                    'max_size' => 'Ukuran gambar terlalu besar',
                    'is_image' => 'Yang anda pilih bukan gambar',
                    'mime_in' => 'Yang anda pilih bukan gambar'
                ]
            ]
        ];
        // dd($this->request->getVar());
        if (!$this->validate($rules)) {
            return redirect()->back()->withInput()->with('error', $this->validator->listErrors());
        }
        $artikel = new ArtikelModel();
        $slug = url_title($this->request->getVar('judul'), '-', true);
        $artikel->insert([
            'judul' => $this->request->getVar('judul'),
            'slug' => $slug,
            'body' => $this->request->getVar('body'),
            'img' => $this->request->getVar('img')
        ]);
        session()->setFlashdata('berhasil', 'Artikel berhasil diposting');
        return redirect()->to('admin.artikel');
    }
    public function delete($id)
    {
        $this->artikel = new ArtikelModel();
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
        echo view('admin/layout.admin/header', $data);
        echo view('admin/layout.admin/top_menu');
        echo view('admin/layout.admin/side_menu');
        return view('admin/artikel/edit', $data);
        echo view('admin/layout.admin/footer');
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
            ],

            'img' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Foto Harus Diisi'
                ]
            ]
        ];
        if (!$this->validate($rules)) {
            return redirect()->back()->withInput()->with('error', $this->validator->listErrors());
        }
        $artikel = new ArtikelModel();
        $slug = url_title($this->request->getVar('judul'), '-', true);
        //dd($this->request->getVar());
        $artikel->save([
            'id' => $id,
            'judul' => $this->request->getVar('judul'),
            'slug' => $slug,
            'body' => $this->request->getVar('body'),
            'img' => $this->request->getVar('img')
        ]);
        session()->setFlashdata('updated', 'Artikel berhasil diupdate');
        return redirect()->to('admin.artikel');
    }
}
