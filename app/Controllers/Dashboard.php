<?php

namespace App\Controllers;

use App\Models\M_listmodul;
use App\Models\M_modul;
use App\Models\UsersModel;
use Config\Services;


class Dashboard extends BaseController
{

    function __construct()
    {
        $this->listmodul = new M_listmodul();
        $this->modul = new M_modul();
        $this->users = new UsersModel();
    }

    public function index()
    {
        // $modul_per_kategori = $this->listmodul->select('COUNT(list_modul.id_list) AS jumlah, moduls.nama_modul')
        // ->join('moduls','list_modul.id_modul=moduls.id')
        // ->groupBy('list_modul.id_modul')
        // ->where('deleted_at', NULL)
        // ->get();

        $sum_modul = $this->db->table('moduls')->selectSum('ketersediaan')
            ->get();

        $sum_nilai = $this->db->table('nilai_sertifikat')->where('is_out', 0)->CountAllResults();

        $sum_transaksi = $this->db->table('shopping_cart')->where('konfirmasi', 1)->CountAllResults();

        $modul_per_kategori = $this->db->table('moduls')->select('ketersediaan AS jumlah, moduls.nama_modul')
            ->get();


        $header['title'] = 'Dashboard';
        echo view('admin/layout/header', $header);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/dashboard', [
            'modul_per_kategori' => $modul_per_kategori,
            'sum_modul' => $sum_modul,
            'sum_nilai' => $sum_nilai,
            'sum_transaksi' => $sum_transaksi,
        ]);
    }



    public function edit($id)
    {
        if ($id != null) {
            $query = $this->db->table('users')->getWhere(['id' => $id]);
            if ($query->resultID->num_rows > 0) {
                $header['title'] = 'Profile Admin';
                $data['users'] = $query->getRow();
                $data['validation'] = \Config\Services::validation();

                echo view('admin/layout/header', $header);
                echo view('admin/layout/top_menu');
                echo view('admin/layout/side_menu');
                echo view('admin/profil', $data);
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
            'nama' => $this->request->getVar('nama'),
            'email'  => $this->request->getVar('email'),
        ];
        $session = session();
        $this->db->table('users')->where(['id' => $id])->update($data);
        session()->setFlashdata('message', "Data Profil dengan email : '{$session->email}' Berhasil Diubah");
        return $this->response->redirect(site_url('dashboard.admin'));
    }

    public function change_password($id)
    {

        $rules = [
            // 'old_password' => [
            //     'rules' => 'required|min_length[6]',
            //     'errors' => [
            //         'required' => 'Masukkan Password Sebelumnya'
            //     ]
            // ],
            'new_password' => [
                'rules' => 'required|min_length[6]',
                'errors' => [
                    'required' => 'Masukkan Password Baru Minimal 6 Digit'
                ]
            ],
            'confirm_password' => [
                'rules' => 'required|matches[new_password]',
                'errors' => [
                    'required' => 'Konfirmasi Password Baru'
                ]
            ]
        ];

        if (!$this->validate($rules)) {
            return redirect()->back()->withInput()->with('error', $this->validator->listErrors());
        }

        $data = [
            'password' => password_hash($this->request->getVar('new_password'), PASSWORD_BCRYPT),
        ];
        $session = session();

        $this->db->table('users')->where(['id' => $id])->update($data);
        session()->setFlashdata('message', "Password dengan email : '{$session->email}' Berhasil Diubah");
        return $this->response->redirect(site_url('dashboard.admin'));
    }
}
