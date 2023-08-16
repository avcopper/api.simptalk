<?php

namespace Controllers\v1\Users;

use Controllers\Controller;

class Update extends Controller
{
    protected function actionDefault(string $id)
    {
        echo json_encode('update');
        die;
    }
}