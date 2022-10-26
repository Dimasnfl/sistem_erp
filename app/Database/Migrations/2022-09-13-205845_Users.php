<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Users extends Migration
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
            'nim' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'email' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'no_hp' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'id_jurusan' => [
                'type' => 'INT',
                'constraint' => '5',
                'unsigned' => true
            ],
            'reguler' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'password' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
            ],
            'is_admin' => [
                'type' => 'BOOLEAN',
                'default' => '0'
            ]
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addUniqueKey('nim');
        $this->forge->addForeignKey('id_jurusan', 'jurusan', 'id');
        $this->forge->createTable('users');
        $this->db->enableForeignKeyChecks();
    }

    public function down()
    {
        $this->forge->dropTable('users');
    }
}
