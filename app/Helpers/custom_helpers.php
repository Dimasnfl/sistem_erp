<?php

function countData($table)
{
    $db = \Config\Database::connect();
    return $db->table($table)->countAllResults();
}

function countList()
{
    $db = \Config\Database::connect();
    return $db->table('list_modul')->select('COUNT(list_modul.id_list) AS jumlah', NULL)->countAllResults();
}




function rupiah($harga)
{
    $harga = 'Rp ' . number_format($harga, 2, ",", ".");
    return $harga;
}
