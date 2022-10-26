<?php 

namespace App\Models;
use CodeIgniter\Model;

class M_listmodul extends Model
{
    protected $table         = 'list_modul';
    protected $primaryKey    = 'id';
    protected $returntype    = 'object';
    protected $allowedFields = ['id_modul'];

    public function getAll()
    {
        $builder = $this->db->table('list_modul');
        $builder->select('list_modul.id as id_list, list_modul.id_modul, moduls.id, moduls.kode as kode, moduls.nama as nama');
        $builder->join('moduls', 'moduls.id = list_modul.id_modul');
        $query   = $builder->get();
        return $query->getResult();
    }
    // public function getAll()
    // {
    //     $builder = $this->db->table('list_modul');
    //     $query   = $builder->get();
    //     return $query->getResult();
    // }

}

                // date('d/m/y', strtotime())
