<?php 

namespace App\Models;
use CodeIgniter\Model;

class M_shopping_cart extends Model
{
    protected $table         = 'shopping_cart';
    protected $primaryKey    = 'id';
    // protected $returntype    = 'object';
    protected $allowedFields = ['id_user', 'id_produk', 'id_sertifikat', 'qty', 'harga'];



    function getProcess()
    {
        $builder = $this->db->table('shopping_cart');
        $builder->select('shopping_cart.id as id_shopping_cart, shopping_cart.id_user, shopping_cart.id_produk, shopping_cart.id_sertifikat, shopping_cart.qty, shopping_cart.harga as shopping_harga, users.id as id_user, users.nama as nama_mhs, users.nim as nim_mhs, moduls.id as moduls_id, moduls.kode_modul');
        $builder->join('users', 'users.id = shopping_cart.id_user');
        $builder->join('moduls', 'moduls.id = shopping_cart.id_produk');
        $query   = $builder->get();
        return $query->getResult();
    }

    function get()
    {
        $builder = $this->db->table('shopping_cart');
        $builder->select('*');
        $builder->where('konfirmasi', 0);
        $query   = $builder->get();
        return $query->getResult();
    }
}