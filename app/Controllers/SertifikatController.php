<?php

namespace App\Controllers;


class SertifikatController extends BaseController
{
    public function index()
    {

        $data = [
            'title' => 'Sertifikat'
        ];
        return view('Sertifikat', $data);
    }
}
