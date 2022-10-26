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

//Modul
$routes->get('/modul', 'ModulController::index');

// Cart
$routes->get('/cart', 'CartController::cart');
$routes->get('/add-to-cart/(:segment)', 'CartController::addtocart/$1');
$routes->get('/remove-from-cart/(:num)', 'CartController::remove/$1');

// Sertifikat
$routes->get('/sertifikat', 'SertifikatController::index', ['filter' => 'logged_in']);

// Login
$routes->get('/login', 'LoginController::index');
$routes->post('/login', 'LoginController::auth');
$routes->get('/logout', 'LoginController::logout');

// Register
$routes->get('/register', 'RegisterController::index');
$routes->post('/register', 'RegisterController::store');

// Admin
//homepage
$routes->get('dashboard.admin', 'Dashboard::index', ['filter' => 'FilterErp']);

//===================================================================
//modul page
$routes->get('admin.modul', 'Modul::index', ['filter' => 'FilterErp']);

//add Modul
$routes->get('admin.modul/add', 'Modul::create', ['filter' => 'FilterErp']);
$routes->post('admin.modul', 'Modul::store', ['filter' => 'FilterErp']);

//edit Modul
$routes->get('admin.modul/edit/(:num)', 'Modul::edit/$1', ['filter' => 'FilterErp']);
$routes->put('admin.modul/(:any)', 'Modul::update/$1', ['filter' => 'FilterErp']);
$routes->delete('admin.modul/(:segment)', 'Modul::destroy/$1', ['filter' => 'FilterErp']);

//import modul
$routes->post('admin.modul/import', 'Modul::import', ['filter' => 'FilterErp']);
//===================================================================

//===================================================================
//sertifikat page
$routes->get('admin.sertifikat', 'Sertifikat::index', ['filter' => 'FilterErp']);

//add sertifikat
$routes->get('admin.sertifikat/add', 'Sertifikat::create', ['filter' => 'FilterErp']);
$routes->post('admin.sertifikat', 'Sertifikat::store', ['filter' => 'FilterErp']);

//edit sertifikat
$routes->get('admin.sertifikat/edit/(:num)', 'Sertifikat::edit/$1', ['filter' => 'FilterErp']);
$routes->put('admin.sertifikat/(:any)', 'Sertifikat::update/$1', ['filter' => 'FilterErp']);
$routes->delete('admin.sertifikat/(:segment)', 'Sertifikat::destroy/$1', ['filter' => 'FilterErp']);

//import sertifikat
$routes->post('admin.sertifikat/import', 'Sertifikat::import', ['filter' => 'FilterErp']);
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

//import List modul
$routes->post('listmodul/import', 'ListModul::import', ['filter' => 'FilterErp']);


// Error Page
$routes->get('/error404', 'customError404::index');

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
