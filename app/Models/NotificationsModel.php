<?php

namespace App\Models;

use CodeIgniter\Model;

class NotificationsModel extends Model
{
    protected $table = 'notifications';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'body'
    ];

    public function notif()
    {
        $builder = $this->db->table('notifications')->countAllResults();
        return $builder;
    }

    public function delete_all()
    {
        $builder = $this->db->table('notifications')->emptyTable();
        return $builder;
    }
}
