<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class ShoppingCart extends Migration
{
    public function up()
    {
        $this->db->disableForeignKeyChecks();
        $this->forge->addField([
            'id' => [
                'type' => 'INT',
                'constraint' => '5',
                'unsigned' => true,
                'auto_increment' => true
            ],
            'id_user' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'id_produk' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
                'null' => true
            ],
            'id_sertifikat' => [
                'type' => 'INT',
                'constraint' => '5',
                'unsigned' => true,
                'null' => true
            ],
            'qty' => [
                'type' => 'INT',
                'constraint' => '5',
                'unsigned' => true
            ],
            'harga' => [
                'type' => 'INT',
                'constraint' => '100',
            ],
            'konfirmasi' => [
                'type' => 'INT',
                'constraint' => '11'
            ],
            'tanggal_checkout' => [
                'type' => 'DATE',
                'default' => NULL
            ]
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addForeignKey('id_user', 'users', 'nim');
        $this->forge->addForeignKey('id_produk', 'moduls', 'kode_modul');
        $this->forge->addForeignKey('id_sertifikat', 'nilai_sertifikat', 'id');
        $this->forge->createTable('shopping_cart');
        $this->db->enableForeignKeyChecks();
    }

    public function down()
    {
        $this->forge->dropTable('shopping_cart');
    }
}
