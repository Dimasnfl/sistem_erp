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
        'is_admin'
    ];
}
