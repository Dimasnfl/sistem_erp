<?php 

namespace App\Models;
use CodeIgniter\Model;

class M_sertifikat_list extends Model
{
    protected $table         = 'nilai_sertifikat';
    protected $primaryKey    = 'id';
    protected $allowedFields = ['jp', 'nilai', 'tanggal_ujian', 'nama_user', 'nim_user', 'result', 'reguler_user', 'kelas', 'status', 'nama_dosen', 'ruangan', 'sertifikat_id', 'no_so', 'keterangan'];

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

    // function getAll()
    // {
    //     $builder = $this->db->table('nilai_sertifikat');
    //     $builder->select('*');
    //     $query   = $builder->get();
    //     return $query->getResult();
    // }

    function getPaginated($num, $keyword = null)
    {
        $builder = $this->builder();
        
        if($keyword != '') {
            $builder->like('nilai', $keyword);
            $builder->orlike('tanggal_ujian', $keyword);
            $builder->orlike('nama_user', $keyword);
            $builder->orlike('nim_user', $keyword);
            $builder->orlike('result', $keyword);
            $builder->orlike('reguler_user', $keyword);
            $builder->orlike('status', $keyword);
            $builder->orlike('nama_dosen', $keyword);
            $builder->orlike('ruangan', $keyword);
            $builder->orlike('sertifikat_id', $keyword);
            $builder->orlike('no_so', $keyword);
            $builder->orlike('keterangan', $keyword);
        }
        return [
            'sertifikat' => $this->paginate($num),
            'pager' => $this->pager,
        ];

    }


}