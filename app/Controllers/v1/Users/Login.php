<?php
namespace Controllers\v1\Users;

use Models\User;
use System\Request;
use Controllers\Controller;
use Exceptions\DbException;
use Exceptions\UserException;

class Login extends Controller
{
    protected function before()
    {
        header("Access-Control-Allow-Methods: POST");
    }

    /**
     * @throws DbException
     * @throws UserException
     */
    protected function actionDefault()
    {
        if (Request::isPost()) {
            $userData = User::getUserDeviceFromApi();
            User::authorize($userData['login'], $userData['password'], $userData);
        }

//        curl --location 'http://auth/v1/users/login/' \
//        --header 'Content-Type: application/json' \
//        --data '{
//         "user": "YW5kcmV3OjhlcFQlSjFAVHVL",
//         "device": "WGlhb21pfFJlZG1pfE0yMDA2QzNNTkd8YW5nZWxpY2FuX3J1fGFuZ2VsaWNhbnwxMHwyOXxRUDFBLjE5MDcxMS4wMjB8VjEyLjAuMTQuMC5RQ1NSVVhNfHVzZXJ8UVAxQS4xOTA3MTEuMDIwfG10Njc2NXxjNC1taXVpLW90YS1iZDEyOC5ianxyZWxlYXNlLWtleXN8MjAyMi0wNi0wMQ==",
//         "ip": "MTkyLjE2OC4wLjExfEZFODA6OjMxOUQ6QzVDMToxNTVDOkY2MTk=",
//         "serviceId": 1
//         }'
    }
}
