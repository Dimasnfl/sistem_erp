<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class NotifUser extends Migration
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
            'body' => [
                'type' => 'TEXT'
            ],
            'user' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ]
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addForeignKey('user', 'users', 'nim');
        $this->forge->createTable('notif_user');
        $this->db->enableForeignKeyChecks();
    }

    public function down()
    {
        $this->forge->dropTable('notif_user');
    }
}
