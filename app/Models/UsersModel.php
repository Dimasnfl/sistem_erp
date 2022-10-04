<?php

namespace APp\Models;

use CodeIgniter\Model;

class UsersModel extends Model
{
    protected $table = 'users';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'nama',
        'nim',
        'jurusan',
        'email',
        'password',
        'no_hp',
        'is_admin'
    ];
}
