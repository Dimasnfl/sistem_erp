<?php

namespace App\Models;

use CodeIgniter\Model;

class ModulsModel extends Model
{
    protected $table = 'moduls';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'nama_modul',
        'harga_modul',
        'ketersediaan',
        'kode_modul'
    ];

    public function getspecific($id)
    {
        $builder = $this->db->table('moduls')->where('kode_modul', $id);
        $query = $builder->get();
        return $query->getResultArray();
    }

    public function updatedata($id, $data)
    {
        $builder = $this->db->table('moduls')->where('kode_modul', $id);
        $builder->update($data);
    }
}