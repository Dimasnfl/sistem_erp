<?php

namespace App\Controllers;

use App\Models\Notif_UserModel;
use CodeIgniter\HTTP\Request;
use App\Models\NotificationsModel;

class NotificationsController extends BaseController
{
    public function notif()
    {
        $notif = new NotificationsModel();
        $pesan = $notif->notif();
        $notif1 = $notif->findAll();
        $result['tot'] = $pesan;
        $result['msg'] = $notif1;
        echo json_encode($result);
    }

    public function delete_notif()
    {
        $notif = new NotificationsModel();
        $result = $notif->delete_all();
        echo json_encode($result);
    }

    public function notif_user()
    {
        $notif = new Notif_UserModel();
        $pesan = $notif->notif();
        $notif1 = $notif->getnotif();
        $result['tot'] = $pesan;
        $result['msg'] = $notif1;
        echo json_encode($result);
    }

    public function delete_notif_user()
    {
        $notif = new Notif_UserModel();
        $result = $notif->delete_all();
        echo json_encode($result);
    }
}
