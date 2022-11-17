<?php

namespace App\Controllers;

use App\Models\M_sertifikat;


class Sertifikat extends BaseController
{

    function __construct()
    {
        $this->sertifikat = new M_sertifikat();
    }

    public function index()
    {
        $header['title'] = 'Data Sertifikat';
        $data = $this->sertifikat->getPaginated(10);
        // $data['pager'] = $this->sertifikat->pager;
        echo view('layout/header', $header);
        echo view('layout/top_menu');
        echo view('layout/side_menu');
        echo view('sertifikat/get', $data);
        echo view('layout/footer');
    }

   

    //FUNCTION IMPORT MODUL
    public function import()
    {
        $file = $this->request->getFile('file_excel');
        $extension = $file->getClientExtension();
        if ($extension == 'xlsx' || $extension == 'xls') {
            if ($extension == 'xls') {
                $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
            } else {
                $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
            }
            $spreadsheet = $reader->load($file);
            $sertifikat = $spreadsheet->getActiveSheet()->toArray();
            foreach ($sertifikat as $key => $value) {
                if ($key == 0) {
                    continue;
                }
                $data = [
                    'kode_sertifikat' => $value[1],
                    'nim' => $value[2],
                    'nama' => $value[3],
                    'nilai' => $value[4],
                    'result' => $value[8],
                    'reguler' => $value[10],
                    'tanggal_ujian' => $value[11],
                    'ruangan' => $value[12],
                    'kelas' => $value[13],
                    'status' => $value[15],
                    'nama_dosen' => $value[16],
                ];
                $this->db->table('sertifikat_excel')->insert($data);
            }

            session()->setFlashdata('message', 'File Excel Berhasil Diimport');
            return $this->response->redirect(site_url('/Sertifikat'));
        } else {
            session()->setFlashdata('message', 'File Excel Tidak Sesuai');
            return $this->response->redirect(site_url('/Sertifikat'));
        }
    }
}
