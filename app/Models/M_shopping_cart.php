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
        $builder->select('shopping_cart.id, shopping_cart.id_user, shopping_cart.id_produk, shopping_cart.id_sertifikat, shopping_cart.qty, shopping_cart.harga, shopping_cart.tanggal_checkout, 
        users.id as users_id, users.nama as nama_user, users.nim, users.id_jurusan, users.reguler, jurusan.nama as nama_jurusan');
        $builder->join('users', 'users.nim = shopping_cart.id_user');
        $builder->join('jurusan', 'jurusan.id = users.id_jurusan');
        $builder->where('konfirmasi', 0);
        $query   = $builder->get();
        return $query->getResult();
    }

    function laporan($from = null, $to = null, $filter_modul = null, $filter_jurusan = null)
    {
        $from  = @$_GET['from'];
        $to = @$_GET['to'];
        $filter_modul = @$_GET['filter_modul'];
        $filter_jurusan = @$_GET['filter_jurusan'];

        $builder = $this->db->table('shopping_cart');
        $builder->select('shopping_cart.id, shopping_cart.id_user, shopping_cart.id_produk, shopping_cart.id_sertifikat, shopping_cart.qty, shopping_cart.harga, shopping_cart.tanggal_checkout,  
        users.id as users_id, users.nama as nama_user, users.nim, users.id_jurusan, users.reguler, jurusan.nama as nama_jurusan, 
        ');
        $builder->join('users', 'users.nim = shopping_cart.id_user');
        $builder->join('jurusan', 'jurusan.id = users.id_jurusan');
        $builder->where('konfirmasi', 1);

        if ($from && $to != '') {
        $builder->where("tanggal_checkout BETWEEN '{$from}' AND '{$to}'");      
        }
        if ($filter_modul != '') {
            $builder->where('id_produk', $filter_modul);      
        }
        if ($filter_jurusan != '') {
            $builder->where('id_jurusan', $filter_jurusan);      
        }

        $query = $builder->get();
        return $query->getResult();
    }

    // function laporan()
    // {
    //     $from  = @$_POST['mulai_tanggal'];
    //     $to = @$_POST['sampai_tanggal'];

    //     return $this->db->table('shopping_cart')
    //         ->select('shopping_cart.id, shopping_cart.id_user, shopping_cart.id_produk, shopping_cart.id_sertifikat, shopping_cart.qty, shopping_cart.harga, shopping_cart.tanggal_checkout,  
    //                  users.id as users_id, users.nama as nama_user, users.nim, users.id_jurusan, users.reguler, jurusan.nama as nama_jurusan')
    //         ->join('users', 'users.nim = shopping_cart.id_user')
    //         ->join('jurusan', 'jurusan.id = users.id_jurusan')
    //         ->where("tanggal_checkout BETWEEN '{$from}' AND '{$to}'")
    //         ->where('konfirmasi', 1)
    //         ->get()
    //         ->getResultArray();
    // }
}