<?php

namespace Controllers\v1\Users;

use Controllers\Controller;

class Delete extends Controller
{
    protected function actionDefault(string $id)
    {
        echo json_encode('delete');
        die;
    }
}