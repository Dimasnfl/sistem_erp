<?php

namespace App\Controllers;

class CustomError404 extends BaseController
{
    public function index()
    {
        return view('error404');
    }
}
