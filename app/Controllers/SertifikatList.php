<?php

namespace App\Controllers;

use App\Models\M_sertifikat_list;


class SertifikatList extends BaseController
{

    function __construct()
    {
        $this->sertifikat_list = new M_sertifikat_list();
    }

    public function index()
    {
        $header['title'] = 'Data Sertifikat';

        $keyword = $this->request->getGet('keyword');
        $data = $this->sertifikat_list->getPaginated(10, $keyword);
        // $data['pager'] = $this->sertifikat->pager;
        echo view('admin/layout/header', $header);
        echo view('admin/layout/top_menu');
        echo view('admin/layout/side_menu');
        echo view('admin/sertifikat/list', $data);
        echo view('admin/layout/footer');
    }



    //FUNCTION IMPORT MODUL
    // public function import()
    // {
    //     $file = $this->request->getFile('file_excel');
    //     $extension = $file->getClientExtension();
    //     if ($extension == 'xlsx' || $extension == 'xls') {
    //         if ($extension == 'xls') {
    //             $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
    //         } else {
    //             $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
    //         }
    //         $spreadsheet = $reader->load($file);
    //         $sertifikat = $spreadsheet->getActiveSheet()->toArray();
    //         foreach ($sertifikat as $key => $value) {
    //             if ($key == 0) {
    //                 continue;
    //             }
    //             $data = [
    //                 'kode_sertifikat' => $value[1],
    //                 'nim' => $value[2],
    //                 'nama' => $value[3],
    //                 'nilai' => $value[4],
    //                 'result' => $value[8],
    //                 'reguler' => $value[10],
    //                 'tanggal_ujian' => $value[11],
    //                 'ruangan' => $value[12],
    //                 'kelas' => $value[13],
    //                 'status' => $value[15],
    //                 'nama_dosen' => $value[16],
    //             ];
    //             $this->db->table('sertifikat_excel')->insert($data);
    //         }

    //         session()->setFlashdata('message', 'File Excel Berhasil Diimport');
    //         return $this->response->redirect(site_url('/Sertifikat'));
    //     } else {
    //         session()->setFlashdata('message', 'File Excel Tidak Sesuai');
    //         return $this->response->redirect(site_url('/Sertifikat'));
    //     }
    // }

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
                    'jp' => $value[1],
                    'nim_user' => $value[2],
                    'nama_user' => $value[3],
                    'nilai' => $value[4],
                    'result' => $value[5],
                    'sertifikat_id' => $value[6],
                    'reguler_user' => $value[7],
                    'tanggal_ujian' => $value[8],
                    'ruangan' => $value[9],
                    'kelas' => $value[10],
                    'no_so' => $value[11],
                    'status' => $value[12],
                    'nama_dosen' => $value[13],
                    'keterangan' => $value[14],
                ];
                $this->db->table('nilai_sertifikat')->insert($data);
            }

            session()->setFlashdata('message', 'File Excel Berhasil Diimport');
            return $this->response->redirect(site_url('admin.SertifikatList'));
        } else {
            session()->setFlashdata('message', 'File Excel Tidak Sesuai');
            return $this->response->redirect(site_url('/admin.SertifikatList'));

        }
    }
}
