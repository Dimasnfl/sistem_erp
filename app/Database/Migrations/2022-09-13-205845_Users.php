<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Users extends Migration
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
            'nama' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'nim' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
                'unique' => true
            ],
            'email' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'no_hp' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'jurusan' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
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
        $this->forge->createTable('users');
    }

    public function down()
    {
        $this->forge->dropTable('users');
    }
}
