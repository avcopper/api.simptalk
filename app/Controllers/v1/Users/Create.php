<?php
namespace Controllers\v1\Users;

use Controllers\Controller;

class Create extends Controller
{
    protected function actionDefault(string $id)
    {
        echo json_encode('create');
        die;
    }
}