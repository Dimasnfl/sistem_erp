<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class JurusanSeeder extends Seeder
{
    public function run()
    {
        $data = [
            [
                'nama' => 'Akuntansi',
                'id_fakultas' => '1'
            ],
            [
                'nama' => 'Manajemen',
                'id_fakultas' => '1'
            ],
            [
                'nama' => 'Informatika',
                'id_fakultas' => '2'
            ],
            [
                'nama' => 'Industri',
                'id_fakultas' => '2'
            ],
            [
                'nama' => 'Sistem Informasi',
                'id_fakultas' => '2'
            ],
            [
                'nama' => 'Elektro',
                'id_fakultas' => '2'
            ],
            [
                'nama' => 'Mesin',
                'id_fakultas' => '2'
            ],
            [
                'nama' => 'Sipil',
                'id_fakultas' => '2'
            ],
            [
                'nama' => 'Bahasa Jepang',
                'id_fakultas' => '3'
            ],
            [
                'nama' => 'Bahasa Inggris',
                'id_fakultas' => '3'
            ],
            [
                'nama' => 'Desain Grafis',
                'id_fakultas' => '4'
            ],
            [
                'nama' => 'Multimedia',
                'id_fakultas' => '4'
            ],
            [
                'nama' => 'Perdagangan Internasional',
                'id_fakultas' => '5'
            ],
            [
                'nama' => 'Perpustakaan dan Sains Informasi',
                'id_fakultas' => '5'
            ],
            [
                'nama' => 'Produksi Film dan Televisi',
                'id_fakultas' => '5'
            ],
        ];

        $this->db->table('jurusan')->insertBatch($data);
    }
}
