<?php 
namespace App\Models;
use CodeIgniter\Model;
class M_modul extends Model
{
    protected $table = 'modul';
    protected $primaryKey = 'id';
    
    protected $allowedFields = ['nama', 'kode', 'harga'];

    public function getStok()
    {
         return $this->db->table('modul');

    }
    // public function getStssok()
    // {
    //     $query = $this->db->query('SELECT modul.id, kode_modul.kode, kode_modul_id, COUNT( * ) as total 
    //     FROM modul
    //     JOIN kode_modul ON kode_modul.id = modul.kode_modul_id
    //     GROUP BY kode_modul_id
    //     ');
    //     return $query->result(); 
    // }
}