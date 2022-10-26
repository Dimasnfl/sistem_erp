<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Jurusans extends Migration
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
            'nama' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'id_fakultas' => [
                'type' => 'INT',
                'constraint' => '5',
                'unsigned' => true
            ]
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addForeignKey('id_fakultas', 'fakultas', 'id');
        $this->forge->createTable('jurusan');
        $this->db->enableForeignKeyChecks();
    }

    public function down()
    {
        $this->forge->dropTable('jurusan');
    }
}
