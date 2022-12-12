<?php

namespace App\Models;

use CodeIgniter\Model;

class Notif_UserModel extends Model
{
    protected $table = 'notif_user';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'body',
        'user'
    ];

    public function notif()
    {
        $builder = $this->db->table('notif_user')->where('user', session('nim'))->countAllResults();
        return $builder;
    }

    public function getnotif()
    {
        $builder = $this->db->table('notif_user')->where('user', session('nim'))->get()->getResultArray();
        return $builder;
    }

    public function delete_all()
    {
        $builder = $this->db->table('notif_user')->where('user', session('nim'));
        $builder->delete();
    }
}
