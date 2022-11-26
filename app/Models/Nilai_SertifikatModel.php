<?php

namespace App\Models;

use CodeIgniter\Model;

class Nilai_SertifikatModel extends Model
{
    protected $table = 'nilai_sertifikat';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'nilai',
        'tanggal_ujian',
        'nim_user',
        'sertifikat_id',
        'nama_user'
    ];

    public function getAll()
    {
        $builder = $this->db->table('nilai_sertifikat');
        $builder->select('nilai_sertifikat.id as id, nilai_sertifikat.*, kode_sertifikat, nama_sertifikat');
        $builder->join('sertifikat', 'sertifikat.kode_sertifikat = nilai_sertifikat.sertifikat_id');
        $builder->where('nim_user', session('nim'));
        $query = $builder->get();
        return $query->getResultArray();
    }

    public function getspecific($id)
    {
        $builder = $this->db->table('nilai_sertifikat')->where('nilai_sertifikat.id', $id);
        $builder->join('sertifikat', 'sertifikat.kode_sertifikat = nilai_sertifikat.sertifikat_id');
        $query = $builder->get();
        return $query->getResultArray();
    }

    public function deletedata($id)
    {
        $builder = $this->db->table('shopping_cart')->where('id_sertifikat', $id)->where('id_user', session('nim'));
        $builder->delete();
    }

    public function updatedata($i, $data2)
    {
        $nilai = $this->db->table('nilai_sertifikat')->where('id', $i);
        $nilai->update($data2);
    }
}
