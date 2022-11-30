<?php

namespace App\Controllers;

use App\Models\UsersModel;


class LoginController extends BaseController
{
    public function index()
    {
        session();
        $data = [
            'title' => 'Login',
            'validation' => \Config\Services::validation()
        ];

        return view('auth/login', $data);
    }

    public function admin()
    {
        session();
        $data = [
            'title' => 'Admin Login',
            'validation' => \Config\Services::validation()
        ];

        return view('auth/login_admin', $data);
    }

    public function auth()
    {

        $user = new UsersModel();
        $email = $this->request->getVar('email');
        $password = $this->request->getVar('password');
        $data = $user->where('email', $email)->first();

        if ($data) {
            $pass = $data['password'];
            $verify = password_verify($password, $pass);
            if ($verify) {
                session()->set([
                    'logged_in' => true,
                    'nama' => $data['nama'],
                    'role' => $data['is_admin'],
                    'nim' => $data['nim'],
                    'reguler' => $data['reguler']
                ]);
                if (session()->get('role') == '1') {
                    return redirect()->to('dashboard.admin');
                } else {
                    return redirect()->to('/');
                }
            } else {
                session()->setFlashdata('error', 'Username atau Password Salah');
                return redirect()->back();
            }
        } else {
            session()->setFlashdata('error', 'Username atau Password Salah');
            return redirect()->back();
        }
    }

    public function logout()
    {
        session()->destroy();
        return redirect()->to('/');
    }
}
