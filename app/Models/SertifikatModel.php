<?php

namespace App\Models;

use CodeIgniter\Model;

class SertifikatModel extends Model
{
    protected $table = 'sertifikat';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'nama_sertifikat',
        'harga_sertifikat',
        'kode_sertifikat'
    ];
}
