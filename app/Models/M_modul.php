<?php 

namespace App\Models;
use CodeIgniter\Model;

class M_modul extends Model
{
    protected $table         = 'moduls';
    protected $primaryKey    = 'id';
    // protected $returntype    = 'object';
    protected $allowedFields = ['nama', 'kode', 'harga'];

    public function getAll()
    {
        $builder = $this->db->table('moduls');
        $builder->select('*');
        $query   = $builder->get();
        return $query->getResult();
    }
    // public function get()
    // {
    //     $query = $this->db->query('SELECT moduls.id as id, kode, nama, harga, COUNT( * ) as ketersediaan 
    //     FROM moduls
    //     JOIN list_modul ON list_modul.id_modul = moduls.id
    //     GROUP BY kode
    //     ');
    //     return $query->getResult(); 
    // }

    public function getStok()
    {
        $builder = $this->db->table('moduls');
        $builder->select('moduls.id as id, kode, nama, harga, COUNT( * ) as ketersediaan');
        $builder->join('list_modul', 'list_modul.id_modul = moduls.id');
        $builder->groupby('kode');
        $query   = $builder->get();
        return $query->getResult();
    }

    public function trash($id1,$id2)
    {
        $builder = $this->db->table('moduls');
        $builder->where('moduls.id', $id1);
        $builder->where('moduls.id = list_modul.id_modul', $id2);
        $builder->delete();
    }
}