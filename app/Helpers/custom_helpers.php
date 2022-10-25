<?php

function countData($table)
{
    $db = \Config\Database::connect();
    return $db->table($table)->countAllResults();
}

function rupiah($harga)
{
    $harga = 'Rp ' . number_format($harga, 2, ",", ".");
    return $harga;
}
