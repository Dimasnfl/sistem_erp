<?php 

namespace App\Models;
use CodeIgniter\Model;

class M_modul extends Model
{
    protected $table         = 'moduls';
    protected $primaryKey    = 'id';
    // protected $returntype    = 'object';
    protected $allowedFields = ['nama_modul', 'kode_modul', 'harga_modul', 'ketersediaan'];

    public function getAll()
    {
        $builder = $this->db->table('moduls');
        $builder->select('*');
        $query   = $builder->get();
        return $query->getResult();
    }
    public function get($keyword = null)
    {
        $builder = $this->db->table('moduls');
        if($keyword != '') {
            $builder->like('nama_modul', $keyword);
            $builder->orlike('kode_modul', $keyword);
            $builder->orlike('harga_modul', $keyword);
            $builder->orlike('ketersediaan', $keyword);
        }
        $query   = $builder->get();
        return $query->getResult();
    }

    public function getStok()
    {
        $builder = $this->db->table('moduls');
        $builder->select('moduls.id as id, kode_modul, nama_modul, harga_modul, COUNT( * ) as ketersediaan');
        $builder->join('list_modul', 'list_modul.id_modul = moduls.id');
        $builder->groupby('kode_modul');
        $builder->where('deleted_at', NULL);
        $builder->orderBy('kode_modul', 'ASC');
        $query   = $builder->get();
        return $query->getResult();
    }


}