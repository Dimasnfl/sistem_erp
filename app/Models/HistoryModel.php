<?php

namespace App\Models;

use CodeIgniter\Model;

class CartModel extends Model
{
    protected $table = 'history';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'id_user', 'id_produk', 'qty', 'id_sertifikat', 'harga', 'konfirmasi', 'tanggal_checkout', 'k_sertifikat', 'k_jp'
    ];
}
