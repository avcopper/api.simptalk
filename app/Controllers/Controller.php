<?php
namespace Controllers;

use Entity\User;
use Models\Model;
use Entity\UserSession;
use System\ErrorSupervisor;
use Models\User as ModelUser;
use Exceptions\NotFoundException;
use Exceptions\ForbiddenException;

/**
 * Class Controller
 * @package Api\Controllers
 */
abstract class Controller
{
    protected Model $model;
    protected ?User $user;        // текущий пользователь
    protected ?string $token; // токен
    protected ?UserSession $userSession; // текущая сессия

    /**
     * Controller constructor
     */
    public function __construct()
    {
        header("Access-Control-Allow-Origin: *");
        //header("Access-Control-Allow-Origin: https://example.com:8080");
        header("Content-Type: application/json; charset=UTF-8");
        header("Access-Control-Max-Age: 3600");
        header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
        header("Strict-Transport-Security: max-age=31536000");
        header("X-Frame-Options: deny");
        header("Content-Security-Policy: default-src 'self'");
        header("X-Content-Type-Options: nosniff");
        header("Cache-Control: no-store");

        new ErrorSupervisor();
        $this->token = ModelUser::getRequestToken();
        $this->userSession = new UserSession();
    }

    /**
     * Проверяет доступ и формирует полное имя action
     * @param string $action
     * @param null $param1
     * @param null $param2
     * @throws ForbiddenException
     * @throws NotFoundException
     */
    public function action(string $action, $param1 = null, $param2 = null)
    {
        if (method_exists($this, $action)) {
            if ($this->access($action)) {
                if (method_exists($this, 'before')) $this->before();

                if (!empty($param1) && !empty($param2))
                    $this->$action($param1, $param2);
                elseif (!empty($param1))
                    $this->$action($param1);
                else
                    $this->$action();

                if (method_exists($this, 'after')) $this->after();
                die;
            } else throw new ForbiddenException();
        } else throw new NotFoundException();
    }

    /**
     * Проверяет доступ к методу в классе $this
     * @param $action - метод, доступ к которому проверяется
     * @return bool
     */
    protected function access($action):bool
    {
        return true;
    }
}
