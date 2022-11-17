<?php 

namespace App\Models;
use CodeIgniter\Model;

class M_modul_in extends Model
{
    protected $table         = 'moduls_in';
    protected $primaryKey    = 'id_in';
    // protected $returntype    = 'object';
    protected $allowedFields = ['id_moduls', 'qty'];




}