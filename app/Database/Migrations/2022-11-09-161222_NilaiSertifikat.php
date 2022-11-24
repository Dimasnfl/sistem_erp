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
            'nama_user' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'nim_user' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'result' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'reguler_user' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'kelas' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'status' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'nama_dosen' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'ruangan' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'sertifikat_id' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
            ],
            'no_so' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
            ],
            'keterangan' => [
                'type' => 'VARCHAR',
                'constraint' => '255'
            ],
            'is_out' => [
                'type' => 'BOOLEAN'
            ]
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addForeignKey('sertifikat_id', 'sertifikat', 'kode_sertifikat');
        $this->forge->createTable('nilai_sertifikat');
        $this->db->enableForeignKeyChecks();
    }

    public function down()
    {
        $this->forge->dropTable('nilai_sertifikat');
    }
}
