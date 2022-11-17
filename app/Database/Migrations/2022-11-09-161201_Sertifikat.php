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
                'constraint' => 255
            ],
            'harga_sertifikat' => [
                'type' => 'INT',
                'constraint' => '100'
            ]
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('sertifikat');
    }

    public function down()
    {
        $this->forge->dropTable('sertifikat');
    }
}
