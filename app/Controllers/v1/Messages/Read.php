<?php
namespace Controllers\v1\Messages;

use Exceptions\UserException;
use System\Crypt;
use Entity\Friend;
use System\Request;
use Entity\Message;
use Controllers\Controller;

class Read extends Controller
{
    protected function before()
    {
        header("Access-Control-Allow-Origin: *");
        //header("Access-Control-Allow-Origin: https://example.com:8080");
        header("Content-Type: application/json; charset=UTF-8");
        header("Access-Control-Allow-Methods: GET");
        header("Access-Control-Allow-Headers: Origin, Content-Type, Authorization");
        //header("Strict-Transport-Security: max-age=31536000");
        header("X-Frame-Options: deny");
        header("Content-Security-Policy: default-src 'self'");
        header("X-Content-Type-Options: nosniff");
        header("Cache-Control: no-store");
    }

    protected function actionDefault(int $friend_id = null, int $last_id = 0)
    {
        if (!empty($friend_id)) {
            $friend = Friend::get(['id' => $friend_id]);
            if (empty($friend->id)) throw new UserException('Unknown friend');

            $messages = Message::getList(['user_id' => $this->user->id, 'friend_id' => $friend->id, 'start' => $last_id]);
        } else {
            $messages = Message::getUserList(['user_id' => $this->user->id, 'order' => 'desc']);
        }



        echo json_encode($messages);
        die;
    }
}
