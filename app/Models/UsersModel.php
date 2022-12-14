<?php

namespace App\Models;

use CodeIgniter\Model;

class UsersModel extends Model
{
    protected $table = 'users';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'nama',
        'nim',
        'id_jurusan',
        'email',
        'password',
        'no_hp',
        'is_admin',
        'reguler'
    ];

    function show_admin(){
        $builder = $this->db->table('users');
        $builder->select('users.id, users.nim, users.nama, users.email, users.no_hp, users.reguler, jurusan.id as jurusan_id, jurusan.nama as jurusan');
        $builder->join('jurusan', 'jurusan.id = users.id_jurusan');
        $builder->where('is_admin', 1);
        $query   = $builder->get();
        return $query->getResult();
    }
}
