<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Moduls extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id' => [
                'type' => 'INT',
                'constraint' => '5',
                'unsigned' => true,
                'auto_increment' => true
            ],
            'nama_modul' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'kode_modul' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
                'unique' => true
            ],
            'ketersediaan' => [
                'type' => 'INT',
                'constraint' => '100',
                'unsigned' => true
            ],
            'harga_modul' => [
                'type' => 'INT',
                'constraint' => '100'
            ]
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('moduls');
    }

    public function down()
    {
        $this->forge->dropTable('moduls');
    }
}
