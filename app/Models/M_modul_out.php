<?php 

namespace App\Models;
use CodeIgniter\Model;

class M_modul_out extends Model
{
    protected $table         = 'moduls_out';
    protected $primaryKey    = 'id_out';
    // protected $returntype    = 'object';
    protected $allowedFields = ['id_moduls', 'qty', 'deleted_at'];



    function getProcess()
    {
        $builder = $this->db->table('moduls_out');
        $builder->select('moduls_out.id_out, moduls_out.id_moduls, moduls_out.qty, moduls_out.deleted_at as date, moduls.id, moduls.kode_modul, moduls.nama_modul');
        $builder->join('moduls', 'moduls.id = moduls_out.id_moduls');
        $query   = $builder->get();
        return $query->getResult();
    }
}