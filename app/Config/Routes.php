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

//homepage
$routes->get('/', 'Dashboard::index');

//===================================================================
//modul page
$routes->get('Modul', 'Modul::index');

//search
$routes->post('Modul', 'Modul::index');


//add Modul
$routes->get('modul/add', 'Modul::create');
$routes->post('modul', 'Modul::store');


$routes->get('modul_in/add', 'Modul_in::create');
$routes->post('modul_in', 'Modul_in::store');
$routes->get('Modul_out', 'Modul_out::index');
$routes->get('modul_out/restore/(:any)', 'Modul_out::restore/$1');
$routes->post('modul_out/restore2', 'Modul_out::restore2');


//edit Modul
$routes->get('modul/edit/(:num)', 'Modul::edit/$1');
$routes->put('modul/(:any)', 'Modul::update/$1');
$routes->delete('modul/(:segment)', 'Modul::destroy/$1');

//import modul
$routes->post('modul/import', 'Modul::import');
//===================================================================

//===================================================================
//sertifikat page
$routes->get('Sertifikat', 'Sertifikat::index');

//add sertifikat
$routes->get('sertifikat/add', 'Sertifikat::create');
$routes->post('sertifikat', 'Sertifikat::store');

//edit sertifikat
$routes->get('sertifikat/edit/(:num)', 'Sertifikat::edit/$1');
$routes->put('sertifikat/(:any)', 'Sertifikat::update/$1');
$routes->delete('sertifikat/(:segment)', 'Sertifikat::destroy/$1');

//import sertifikat
$routes->post('sertifikat/import', 'Sertifikat::import');
//===================================================================

//===================================================================
//list modul page
$routes->get('ListModul', 'ListModul::index');

//add List Modul
$routes->get('listmodul/add', 'ListModul::create');
$routes->post('listmodul', 'ListModul::store');

//edit List Modul
$routes->get('listmodul/edit/(:num)', 'ListModul::edit/$1');
$routes->put('listmodul/(:any)', 'ListModul::update/$1');
$routes->delete('listmodul/(:segment)', 'ListModul::destroy/$1');

//process modul
$routes->get('listmodul/restore/(:any)', 'ListModul::restore/$1');
$routes->get('listmodul/restore', 'ListModul::restore');
$routes->delete('listmodul/konfirm/(:any)', 'ListModul::konfirm/$1');
$routes->delete('listmodul/destroy2/(:any)', 'ListModul::destroy2/$1');



//import List modul
$routes->post('listmodul/import', 'ListModul::import');
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
