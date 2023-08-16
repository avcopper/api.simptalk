<?php
namespace Controllers\v1\Users;

use Controllers\Controller;

class Read extends Controller
{
    protected function before()
    {
        header("Access-Control-Allow-Origin: *");
        //header("Access-Control-Allow-Origin: https://example.com:8080");
        header("Content-Type: application/json; charset=UTF-8");
        header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT");
        header("Access-Control-Allow-Headers: Origin, Content-Type, Authorization");
        //header("Strict-Transport-Security: max-age=31536000");
        header("X-Frame-Options: deny");
        header("Content-Security-Policy: default-src 'self'");
        header("X-Content-Type-Options: nosniff");
        header("Cache-Control: no-store");
    }

    protected function actionDefault(string $id)
    {

        echo json_encode('read');
        die;
    }
}