<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class FakultasSeeder extends Seeder
{
    public function run()
    {
        $data = [
            [
                'nama' => 'Fakultas Ekonomi dan Bisnis'
            ],
            [
                'nama' => 'Fakultas Teknik'
            ],
            [
                'nama' => 'Fakultas Bahasa'
            ],
            [
                'nama' => 'Fakultas Desain dan Komunikasi Visual'
            ],
            [
                'nama' => 'Fakultas Ilmu Sosial dan Ilmu Politik'
            ]
        ];

        $this->db->table('fakultas')->insertBatch($data);
    }
}
