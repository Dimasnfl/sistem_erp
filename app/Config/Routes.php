<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (is_file(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
// $routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.


// Home
$routes->get('/', 'Home::index');
$routes->post('/admin.modul/get_tot', 'NotificationsController::notif');
$routes->post('/clear_notif', 'NotificationsController::delete_notif');
$routes->post('/notif_user', 'NotificationsController::notif_user');
$routes->post('/del-notif', 'NotificationsController::delete_notif_user');

//Modul
$routes->get('/modul', 'ModulController::index');
$routes->post('add', 'CartController::add');

// Cart
$routes->get('/cart', 'CartController::cart');
$routes->get('/remove-from-cart/(:segment)', 'CartController::remove/$1');
$routes->post('/checkout', 'CartController::Checkout');
$routes->post('/update-cart', 'CartController::updatecart');

// Sertifikat
$routes->get('/sertifikat', 'SertifikatController::index', ['filter' => 'logged_in']);
$routes->get('/add-sertifikat/(:num)', 'SertifikatController::addsertifikat/$1');
$routes->get('/remove-sertifikat/(:any)', 'SertifikatController::removesertifikat/$1');

// Login
$routes->get('/login', 'LoginController::index');
$routes->post('/login', 'LoginController::auth');
$routes->get('/logout', 'LoginController::logout');
$routes->get('/login.admin', 'LoginController::admin');
$routes->post('/login.admin', 'LoginController::auth_admin');

// Register
$routes->get('/register', 'RegisterController::index');
$routes->post('/register', 'RegisterController::store');

// History
$routes->get('/history', 'HistoryController::index');

// Error Page
$routes->get('/error404', 'customError404::index');

//homepage
$routes->get('dashboard.admin', 'Dashboard::index', ['filter' => 'FilterErp']);

//===================================================================
//modul page
$routes->get('admin.Modul', 'Modul::index', ['filter' => 'FilterErp']);

//search
$routes->post('Modul', 'Modul::index');

//artikel
$routes->get('admin.artikel', 'Artikel::index', ['filter' => 'FilterErp']);
$routes->delete('admin.artikel/delete/(:num)', 'Artikel::delete/$1', ['filter' => 'FilterErp']);
$routes->get('admin.artikel/add', 'Artikel::create', ['filter' => 'FilterErp']);
$routes->post('admin.artikel', 'Artikel::save', ['filter' => 'FilterErp']);
$routes->get('admin.artikel/edit/(:segment)', 'Artikel::edit/$1', ['filter' => 'FilterErp']);
$routes->post('admin.artikel/edit/(:segment)', 'Artikel::update/$1', ['filter' => 'FilterErp']);
$routes->get('/detail/(:segment)', 'Home::detail/$1',);

//add Modul
$routes->get('modul/add', 'Modul::create', ['filter' => 'FilterErp']);
$routes->post('modul', 'Modul::store', ['filter' => 'FilterErp']);


$routes->get('modul_in/add', 'Modul_in::inc', ['filter' => 'FilterErp']);
$routes->post('modul_in', 'Modul_in::increase', ['filter' => 'FilterErp']);
$routes->get('modul_in/dec', 'Modul_in::dec', ['filter' => 'FilterErp']);
$routes->post('modul_in/decrease', 'Modul_in::decrease', ['filter' => 'FilterErp']);
$routes->get('Modul_out', 'Modul_out::index', ['filter' => 'FilterErp']);
$routes->get('modul_out/restore/(:any)', 'Modul_out::restore/$1', ['filter' => 'FilterErp']);
$routes->post('modul_out/restore2', 'Modul_out::restore2', ['filter' => 'FilterErp']);
$routes->get('modul_out/konfirmasi/(:any)', 'Modul_out::konfirmasi/$1');
// $routes->get('modul_out/konfirmasi/(:any)', 'Modul_out::konfirmasi/$1');
// $routes->post('modul_out/', 'Modul_out::store_konfirmasi');


//edit Modul
$routes->get('modul/edit/(:num)', 'Modul::edit/$1', ['filter' => 'FilterErp']);
$routes->put('modul/(:any)', 'Modul::update/$1', ['filter' => 'FilterErp']);
$routes->delete('modul/(:segment)', 'Modul::destroy/$1', ['filter' => 'FilterErp']);

//import modul
$routes->post('modul/import', 'Modul::import', ['filter' => 'FilterErp']);
//===================================================================

//===================================================================
//sertifikat page
$routes->get('admin.SertifikatList', 'SertifikatList::index');
$routes->get('admin.Sertifikat', 'Sertifikat::index');


//add sertifikat
$routes->get('sertifikat/add', 'Sertifikat::create', ['filter' => 'FilterErp']);
$routes->post('sertifikat', 'Sertifikat::store', ['filter' => 'FilterErp']);

//edit sertifikat
$routes->get('sertifikat/edit/(:num)', 'Sertifikat::edit/$1', ['filter' => 'FilterErp']);
$routes->put('sertifikat/(:any)', 'Sertifikat::update/$1', ['filter' => 'FilterErp']);
$routes->delete('sertifikat/(:segment)', 'Sertifikat::destroy/$1', ['filter' => 'FilterErp']);

//import sertifikat
$routes->post('sertifikatlist/import', 'SertifikatList::import', ['filter' => 'FilterErp']);
//===================================================================

//===================================================================
//list modul page
$routes->get('ListModul', 'ListModul::index', ['filter' => 'FilterErp']);

//add List Modul
$routes->get('listmodul/add', 'ListModul::create', ['filter' => 'FilterErp']);
$routes->post('listmodul', 'ListModul::store', ['filter' => 'FilterErp']);

//edit List Modul
$routes->get('listmodul/edit/(:num)', 'ListModul::edit/$1', ['filter' => 'FilterErp']);
$routes->put('listmodul/(:any)', 'ListModul::update/$1', ['filter' => 'FilterErp']);
$routes->delete('listmodul/(:segment)', 'ListModul::destroy/$1', ['filter' => 'FilterErp']);

//process modul
$routes->get('listmodul/restore/(:any)', 'ListModul::restore/$1', ['filter' => 'FilterErp']);
$routes->get('listmodul/restore', 'ListModul::restore', ['filter' => 'FilterErp']);
$routes->delete('listmodul/konfirm/(:any)', 'ListModul::konfirm/$1', ['filter' => 'FilterErp']);
$routes->delete('listmodul/destroy2/(:any)', 'ListModul::destroy2/$1', ['filter' => 'FilterErp']);

//Laporan
$routes->get('admin.Laporan', 'Laporan::index', ['filter' => 'FilterErp']);


//import List modul
$routes->post('listmodul/import', 'ListModul::import', ['filter' => 'FilterErp']);

//profil admin
$routes->get('/profil/edit/(:any)', 'Dashboard::edit/$1', ['filter' => 'FilterErp']);
$routes->put('profil/edit/change_profil/(:any)', 'Dashboard::update/$1', ['filter' => 'FilterErp']);
$routes->put('profil/edit/change_password/(:any)', 'Dashboard::change_password/$1', ['filter' => 'FilterErp']);

//===================================================================
//users page
$routes->get('admin.users', 'Users::index');


//add sertifikat
$routes->get('users/add', 'Users::create', ['filter' => 'FilterErp']);
$routes->post('users', 'Users::store', ['filter' => 'FilterErp']);

//edit sertifikat
$routes->get('users/edit/(:num)', 'Users::edit/$1', ['filter' => 'FilterErp']);
$routes->put('users/edit/change_info/(:any)', 'Users::update/$1', ['filter' => 'FilterErp']);
$routes->put('users/edit/change_password/(:any)', 'Users::update2/$1', ['filter' => 'FilterErp']);
$routes->delete('users/(:segment)', 'Users::destroy/$1', ['filter' => 'FilterErp']);


//===================================================================
/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
