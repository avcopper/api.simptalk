<?php
session_start();
require __DIR__ . '/../app/System/ErrorSupervisor.php';
require __DIR__ . '/../config/autoload.php';
require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . '/../config/constants.php';

use System\Route;
use System\Response;
use System\Security;

Security::array_xss_clean($_GET);
Security::array_xss_clean($_POST);
Security::array_xss_clean($_PUT);
Security::array_xss_clean($_DELETE);
Security::array_xss_clean($_PATCH);

Route::parseUrl($_SERVER['REQUEST_URI']);

try {
    Route::startApi();
} catch (Exception $e) {
    (new Response($e->getCode(), false, $e->getMessage()))->send();
}

session_destroy();
