<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Sertifikat extends Migration
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
            'nama_sertifikat' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'kode_sertifikat' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ]
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addUniqueKey('kode_sertifikat');
        $this->forge->createTable('sertifikat');
    }

    public function down()
    {
        $this->forge->dropTable('sertifikat');
    }
}
