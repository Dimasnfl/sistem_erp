<?php

namespace App\Models;

use CodeIgniter\Model;

class CartModel extends Model
{
    protected $table = 'shopping_cart';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'id_user', 'id_produk', 'qty', 'id_sertifikat', 'harga'
    ];

    public function getAll()
    {
        $builder = $this->db->table('shopping_cart');
        $builder->select('shopping_cart.id as id, id_user , id_produk, id_sertifikat, qty, nama_modul, harga, nilai_sertifikat.* ,sertifikat.*');
        $builder->join('moduls', 'moduls.kode_modul = shopping_cart.id_produk', 'left');
        $builder->join('nilai_sertifikat', 'nilai_sertifikat.id = shopping_cart.id_sertifikat', 'left');
        $builder->join('sertifikat', 'sertifikat.kode_sertifikat = nilai_sertifikat.sertifikat_id', 'left');
        $builder->where('id_user', session('nim'));
        $query = $builder->get();
        return $query->getResultArray();
    }

    public function getspecific($id)
    {
        $builder = $this->db->table('shopping_cart')->where('id_produk', $id)->where('id_user', session('nim'));
        $query = $builder->get();
        return $query->getResultArray();
    }

    public function getspecific2($id)
    {
        $builder = $this->db->table('shopping_cart')->where('id_sertifikat', $id)->where('id_user', session('nim'));
        $query = $builder->get();
        return $query->getResultArray();
    }


    public function updatedata($id, $data)
    {
        $builder = $this->db->table('shopping_cart')->where('id_produk', $id)->where('id_user', session('nim'));
        $builder->update($data);
    }

    public function Countdata()
    {
        $builder = $this->db->table('shopping_cart');
        $builder->select('shopping_cart.id as id, id_user , id_produk, id_sertifikat, qty, nama_modul, harga, nilai_sertifikat.* ,sertifikat.*');
        $builder->join('moduls', 'moduls.kode_modul = shopping_cart.id_produk', 'left');
        $builder->join('nilai_sertifikat', 'nilai_sertifikat.id = shopping_cart.id_sertifikat', 'left');
        $builder->join('sertifikat', 'sertifikat.id = nilai_sertifikat.sertifikat_id', 'left');
        $builder->where('id_user', session('nim'));
        return $builder->countAllResults();
    }

    public function deletedata($id)
    {
        $builder = $this->db->table('shopping_cart')->where('id_produk', $id)->where('id_user', session('nim'));
        $builder->delete();
    }
}