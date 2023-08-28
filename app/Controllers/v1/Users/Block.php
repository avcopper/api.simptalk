<?php

namespace Controllers\v1\Users;

use Entity\User;
use System\Request;
use System\Response;
use Models\UserBlock;
use Models\UserSession;
use Models\User as ModelUser;
use Exceptions\UserException;
use Controllers\Controller;

class Block extends Controller
{
    protected function before()
    {
        if (!ModelUser::isAuthorized()) throw new UserException('Unauthorized', 401);
        header("Access-Control-Allow-Methods: POST");
        $this->model = new UserSession();
    }

    protected function actionDefault()
    {}

    /**
     * Блокировка пользователя, сессии при вводе emergency PIN
     * @return void
     * @throws UserException
     */
    protected function actionPin()
    {
        if (Request::isPost() && !empty($this->user) && !empty($this->userSession)) {
            $this->user->isBlocked = true;
            $this->userSession->isActive = false;

            $userBlocks = new UserBlock();
            $userBlocks->user_id = $this->user->id;
            $userBlocks->expire = '2100-01-01 00:00:00';
            $userBlocks->reason = 'emergency PIN';
            $userBlocks->created = date('Y-m-d H:i:s');

            // TODO добавить пометку всех сообщений удаленными

            if ($this->user->save() && $this->userSession->save() && $userBlocks->save()) (new Response(200, true))->send();
            else throw new UserException('Saving error...', 400);
        }
    }
}
