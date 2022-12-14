<?php

namespace App\Controllers;

use App\Models\JurusanModel;
use App\Models\UsersModel;
use Config\Services;


class Users extends BaseController
{

    function __construct()
    {
        $this->users = new UsersModel();
        $this->jurusan = new JurusanModel();
    }

    public function index()
    {
        $header['title'] = 'Data Admin';
        $data['users'] = $this->users->show_admin();

        echo view('admin/layout/header', $header);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/users/get', $data);
        echo view('admin/layout/footer');
    }

    public function create()
    {
        $header['title'] = 'Form Tambah Data Admin';
        $jurusan = $this->jurusan->findAll();
        $data = [
            'validation' => Services::validation(),
            'jurusan' => $jurusan
        ];
        echo view('admin/layout/header', $header);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/users/add', $data);
        echo view('admin/layout/footer');
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
            'password1' => [
                'rules' => 'required|min_length[6]',
                'errors' => [
                    'required' => 'Password Harus Diisi Minimal 6 Digit'
                ]
            ],
            'password2' => [
                'rules' => 'required|matches[password1]',
                'errors' => [
                    'required' => 'Konfirmasi Password Harus Diisi',
                    'matches' => 'Konfirmasi Password Tidak Sesuai'
                ]
            ],
            'no_hp' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'No Handphone Harus Diisi'
                ]
            ],
            'reguler' => [
                'rules' => 'in_list[A,B1,B2]|required'
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
            'password' => password_hash($this->request->getVar('password1'), PASSWORD_BCRYPT),
            'no_hp' => $this->request->getVar('no_hp'),
            'reguler' => $this->request->getVar('reguler'),
            'is_admin' => 1
        ]);
            session()->setFlashdata('message', 'Data Admin Telah Tersimpan');
            return $this->response->redirect(site_url('admin.users'));
    }

    public function edit($id = null)
    {
        if ($id != null) {
            $query = $this->db->table('users')->getWhere(['id' => $id]);
            if ($query->resultID->num_rows > 0) {
                $header['title'] = 'Form Edit Data Admin';
                $users = $query->getRow();
                $jurusan = $this->jurusan->findAll();
                $data = [
                    'validation' => Services::validation(),
                    'jurusan' => $jurusan,
                    'users' => $users
                ];
                echo view('admin/layout/header', $header);
                echo view('admin/layout/top_menu');
                echo view('admin/layout/side_menu');
                echo view('admin/users/edit', $data);
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

        // $rules = [
        //     'nama' => [
        //         'rules' => 'required|min_length[5]',
        //         'errors' => [
        //             'required' => 'Nama Harus Diisi'
        //         ]
        //     ],
        //     'nim' => [
        //         'rules' => 'required',
        //         'errors' => [
        //             'required' => 'NIM Harus Diisi'
        //         ]
        //     ],
        //     'email' => [
        //         'rules' => 'required|min_length[6]|valid_email',
        //         'errors' => [
        //             'required' => 'Email Harus Diisi'
        //         ]
        //     ],
        //     'no_hp' => [
        //         'rules' => 'required',
        //         'errors' => [
        //             'required' => 'No Handphone Harus Diisi'
        //         ]
        //     ]
        // ];

        // if (!$this->validate($rules)) {
        //     return redirect()->back()->withInput()->with('error', $this->validator->listErrors());
        // }

        $data = [
            'nama' => $this->request->getVar('nama'),
            'nim' => $this->request->getVar('nim'),
            'email' => $this->request->getVar('email'),
            'no_hp' => $this->request->getVar('no_hp')
        ];
        $this->db->table('users')->where(['id' => $id])->update($data);
        session()->setFlashdata('message', 'Data Informasi Admin Berhasil Diubah');
        return $this->response->redirect(site_url('admin.users'));
    }

    public function update2($id)
    {

        $rules = [
            'password1' => [
                'rules' => 'required|min_length[6]',
                'errors' => [
                    'required' => 'Password Harus Diisi Minimal 6 Digit'
                ]
            ],
            'password2' => [
                'rules' => 'required|matches[password1]',
                'errors' => [
                    'required' => 'Konfirmasi Password Harus Diisi',
                    'matches' => 'Konfirmasi Password Tidak Sesuai'
                ]
            ]
        ];

        if (!$this->validate($rules)) {
            return redirect()->back()->withInput()->with('error', $this->validator->listErrors());
        }

        $data = [
            'password' => password_hash($this->request->getVar('password1'), PASSWORD_BCRYPT),
        ];
        $this->db->table('users')->where(['id' => $id])->update($data);
        session()->setFlashdata('message', 'Password Admin Berhasil Diubah');
        return $this->response->redirect(site_url('admin.users'));
    }

    public function destroy($id)
    {
        $this->users->where(['id' => $id])->delete();
        session()->setFlashdata('message', 'Admin Berhasil Dihapus');
        return $this->response->redirect(site_url('admin.users'));
    }

    
}
