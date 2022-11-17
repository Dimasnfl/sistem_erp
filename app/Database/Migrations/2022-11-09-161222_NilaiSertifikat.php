<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class NilaiSertifikat extends Migration
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
            'nilai' => [
                'type' => 'INT',
                'constraint' => '5',
                'unsigned' => true
            ],
            'tanggal_ujian' => [
                'type' => 'DATE'
            ],
            'user_id' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'sertifikat_id' => [
                'type' => 'INT',
                'constraint' => '5',
                'unsigned' => true,
            ]
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addForeignKey('sertifikat_id', 'sertifikat', 'id');
        $this->forge->addForeignKey('user_id', 'users', 'nim');
        $this->forge->createTable('nilai_sertifikat');
        $this->db->enableForeignKeyChecks();
    }

    public function down()
    {
        $this->forge->dropTable('nilai_sertifikat');
    }
}
