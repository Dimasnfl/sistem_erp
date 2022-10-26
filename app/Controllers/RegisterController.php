<?php

namespace App\Controllers;

use App\Models\JurusanModel;
use App\Models\UsersModel;

use Config\Services;
use Faker\Extension\Helper;

class RegisterController extends BaseController
{

    protected $helpers = ['form'];

    public function index()
    {
        $jurusan = new JurusanModel();
        $jurusans = $jurusan->findAll();
        $data = [
            'title' => 'Register',
            'validation' => Services::validation(),
            'jurusans' => $jurusans
        ];
        return view('auth/register', $data);
    }

    public function store()
    {
        $rules = [
            'nama' => [
                'rules' => 'required|min_length[5]',
                'errors' => [
                    'required' => 'Nama Harus Diisi'
                ]
            ],
            'nim' => [
                'rules' => 'required|is_unique[users.nim,id,{id}]',
                'errors' => [
                    'required' => 'NIM Harus Diisi',
                    'is_unique' => 'NIM Sudah Terdaftar'
                ]
            ],

            'id_jurusan' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Jurusan Harus Diisi'
                ]
            ],
            'email' => [
                'rules' => 'required|min_length[6]|valid_email',
                'errors' => [
                    'required' => 'Email Harus Diisi'
                ]
            ],
            'password' => [
                'rules' => 'required|min_length[6]',
                'errors' => [
                    'required' => 'Password Harus Diisi'
                ]
            ],
            'no_hp' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'No Handphone Harus Diisi'
                ]
            ],
            'reguler' => [
                'rules' => 'in_list[A,B]'
            ]
        ];

        if (!$this->validate($rules)) {
            return redirect()->back()->withInput()->with('error', $this->validator->listErrors());
        }
        $users = new UsersModel();
        $users->insert([
            'nama' => $this->request->getVar('nama'),
            'nim' => $this->request->getVar('nim'),
            'id_jurusan' => $this->request->getVar('id_jurusan'),
            'email' => $this->request->getVar('email'),
            'password' => password_hash($this->request->getVar('password'), PASSWORD_BCRYPT),
            'no_hp' => $this->request->getVar('no_hp')
        ]);
        session()->setFlashdata('berhasil', 'Registrasi Berhasil');
        return redirect()->to('/login');
    }
}
