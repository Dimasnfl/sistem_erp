<?php 

namespace App\Models;
use CodeIgniter\Model;

class M_sertifikat extends Model
{
    protected $table         = 'sertifikat_excel';
    protected $primaryKey    = 'id';
    protected $allowedFields = ['kode', 'nim', 'nama', 'nilai', 'result', 'reguler', 'tanggal_ujian', 'ruangan', 'kelas', 'status', 'nama_dosen'];

    // public function getAlll()
    // {
    //     $builder = $this->db->table('sertifikat');
    //     $builder->select('
    //     sertifikat.id as id_sertifikat, sertifikat.nama_sertifikat, sertifikat.kode_sertifikat, sertifikat.harga_sertifikat, 
    //     nilai_sertifikat.id as id_nilai, nilai_sertifikat.nilai, nilai_sertifikat.tanggal_ujian, nilai_sertifikat.user_id, nilai_sertifikat.sertifikat_id, nilai_sertifikat.kelas, nilai_sertifikat.nama_dosen, nilai_sertifikat.result, 
    //     users.id as id_users, users.nama as nama_users, users.nim as nim_users, users.email as users_email, users.no_hp as user_no, users.id_jurusan, users.reguler, ');
    //     $builder->join('nilai_sertifikat', 'nilai_sertifikat.sertifikat_id = sertifikat.id');
    //     $builder->join('users', 'users.id = nilai_sertifikat.user_id');
    //     $builder->join('jurusan', 'jurusan.id = users.id_jurusan');
    //     $builder->join('fakultas', 'fakultas.id = jurusan.id_fakultas');
    //     $query   = $builder->get();
    //     return $query->getResult();
    // }

    function getAll()
    {
        $builder = $this->db->table('sertifikat_excel');
        $builder->select('*');
        $query   = $builder->get();
        return $query->getResult();
    }

    function getPaginated($num, $keyword = null)
    {
        $builder = $this->db->table('sertifikat_excel');
        return [
            'sertifikat' => $this->paginate($num),
            'pager' => $this->pager,
        ];

    }



    // public function excel($num, $keyword = null)
    // {
    //     $builder = $this->db->table('sertifikat_excel');
    //     $builder->select('*');
    //     return [
    //         'sertifikat_excel' => $this->paginate($num),
    //         'pager' => $this->pager,
    //     ];
    //     $query   = $builder->get();
    //     return $query->getResult();
    // }


}