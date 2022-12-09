<?php

namespace App\Models;

use CodeIgniter\Model;

class HistoryModel extends Model
{
    protected $table = 'history';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'id_user', 'id_produk', 'qty', 'id_sertifikat', 'harga', 'konfirmasi', 'tanggal_checkout', 'k_sertifikat', 'k_jp'
    ];

    public function getAll()
    {
        $builder = $this->db->table('history');
        $builder->select('history.id as id, id_user , id_produk, id_sertifikat, qty, nama_modul, tanggal_checkout,  harga, nilai_sertifikat.* ,sertifikat.*');
        $builder->join('moduls', 'moduls.kode_modul = history.id_produk', 'left');
        $builder->join('nilai_sertifikat', 'nilai_sertifikat.id = history.id_sertifikat', 'left');
        $builder->join('sertifikat', 'sertifikat.kode_sertifikat = nilai_sertifikat.sertifikat_id', 'left');
        $builder->where('id_user', session('nim'));
        $query = $builder->get();
        return $query->getResultArray();
    }
}
