<?php
require __DIR__ . '/../config/autoload.php';
require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . '/../config/constants.php';

session_start();

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
    Response::result($e->getCode(), false, $e->getMessage());
}

session_destroy();