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
        $builder = $this->db->table('shopping_cart');
        $builder->select('shopping_cart.id as id, id_user , id_produk, id_sertifikat, qty, nama_modul, tanggal_checkout,  harga, nilai_sertifikat.* ,sertifikat.*');
        $builder->join('moduls', 'moduls.kode_modul = shopping_cart.id_produk', 'left');
        $builder->join('nilai_sertifikat', 'nilai_sertifikat.id = shopping_cart.id_sertifikat', 'left');
        $builder->join('sertifikat', 'sertifikat.kode_sertifikat = nilai_sertifikat.sertifikat_id', 'left');
        $builder->where('id_user', session('nim'))->where('konfirmasi', 1);
        $query = $builder->get();
        return $query->getResultArray();
    }

    function laporan($num, $from = null, $to = null)
    {
        $from  = @$_GET['from'];
        $to = @$_GET['to'];
        $filter_modul = @$_GET['filter_modul'];
        $filter_sertifikat = @$_GET['filter_sertifikat'];
        $filter_jurusan = @$_GET['filter_jurusan'];
        $filter_reguler = @$_GET['filter_reguler'];
        $filter_jp = @$_GET['filter_jp'];


        $builder = $this->db->table('history');
        $builder->select('history.id, history.id_user, history.id_produk, history.id_sertifikat, history.qty, history.harga, history.tanggal_checkout, history.k_sertifikat, history.k_jp,  
        users.id as users_id, users.nama as nama_user, users.nim, users.id_jurusan, users.reguler, jurusan.nama as nama_jurusan 
        ');
        $builder->join('users', 'users.nim = history.id_user');
        $builder->join('jurusan', 'jurusan.id = users.id_jurusan');
        // $builder->join('nilai_sertifikat', 'nilai_sertifikat.id = history.id_sertifikat');

        if ($from && $to != '') {
            $builder->where("tanggal_checkout BETWEEN '{$from}' AND '{$to}'");
        }
        if ($filter_modul != '') {
            $builder->where('id_produk', $filter_modul);
        }
        if ($filter_sertifikat != '') {
            $builder->where('k_sertifikat', $filter_sertifikat);
        }
        if ($filter_jurusan != '') {
            $builder->where('id_jurusan', $filter_jurusan);
        }
        if ($filter_reguler != '') {
            $builder->where('reguler', $filter_reguler);
        }
        if ($filter_jp != '') {
            $builder->like('k_jp', $filter_jp);
        }

        $query = $builder->get();
        return $query->getResult();
    }
}
