<?php
namespace Controllers\v1\Users;

use System\Auth;
use System\Response;
use Models\User as ModelUser;
use Exceptions\UserException;
use Controllers\Controller;

class Validate extends Controller
{
    /**
     * @throws UserException
     */
    protected function before()
    {
        if (!ModelUser::isAuthorized()) throw new UserException(Auth::NOT_AUTHORIZED, 401);
        header("Access-Control-Allow-Methods: POST");
    }

    protected function actionDefault()
    {
        Response::result(200, true, 'OK', [], $this->token);

//        curl --location 'http://simptalk/api/v1/users/validate/' \
//        --header 'Content-Type: application/json' \
//        --header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJodHRwOi8vc2ltcHRhbGsiLCJhdWQiOiJhbmRyZXciLCJpYXQiOjE2NzY3MzIwNjEsIm5iZiI6MTY3NjczMjA2MSwiZXhwIjoxNjc2ODE4NDYxLCJkYXRhIjp7ImlkIjoxLCJzZXJ2aWNlX2lkIjoxLCJpcCI6IjE5Mi4xNjguMC4xMXxGRTgwOjozMTlEOkM1QzE6MTU1QzpGNjE5IiwiZGV2aWNlIjoiWGlhb21pfFJlZG1pfE0yMDA2QzNNTkd8YW5nZWxpY2FuX3J1fGFuZ2VsaWNhbnwxMHwyOXxRUDFBLjE5MDcxMS4wMjB8VjEyLjAuMTQuMC5RQ1NSVVhNfHVzZXJ8UVAxQS4xOTA3MTEuMDIwfG10Njc2NXxjNC1taXVpLW90YS1iZDEyOC5ianxyZWxlYXNlLWtleXN8MjAyMi0wNi0wMSIsImV4cGlyZWQiOiIyMDIzLTAyLTE5IDIxOjU0OjIxIn19.4BxtNGf_ilKu1htjIX8HsoJVYexbuXPINxCRWWmCWncIGC_CQ0JXDm7u3dZaxRdJSta1nZFzg0nqUwkE1gEF3Q' \
//        --data '{
//         "device": "WGlhb21pfFJlZG1pfE0yMDA2QzNNTkd8YW5nZWxpY2FuX3J1fGFuZ2VsaWNhbnwxMHwyOXxRUDFBLjE5MDcxMS4wMjB8VjEyLjAuMTQuMC5RQ1NSVVhNfHVzZXJ8UVAxQS4xOTA3MTEuMDIwfG10Njc2NXxjNC1taXVpLW90YS1iZDEyOC5ianxyZWxlYXNlLWtleXN8MjAyMi0wNi0wMQ==",
//         "ip": "MTkyLjE2OC4wLjExfEZFODA6OjMxOUQ6QzVDMToxNTVDOkY2MTk=",
//         "service_id": 1
//         }'
    }
}
