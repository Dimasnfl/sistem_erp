<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class UserSeeder extends Seeder
{
    public function run()
    {
        $data = [
            'nama' => 'darth',
            'email'    => 'darth@theempire.com',
            'nim' => '1234567890',
            'no_hp' => '08123456789',
            'id_jurusan' => '1',
            'reguler' => 'A',
            'password' => password_hash('12345', PASSWORD_BCRYPT),
            'is_admin' => '1'
        ];

        $this->db->table('users')->insert($data);
    }
}
