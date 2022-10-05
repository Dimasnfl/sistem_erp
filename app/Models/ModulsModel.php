<?php

namespace App\Models;

use CodeIgniter\Model;

class ModulsModel extends Model
{
    protected $table = 'moduls';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'nama',
        'harga',
        'ketersediaan',
        'Kode'
    ];
}
