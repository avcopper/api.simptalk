<?php
namespace System;

use Exceptions\NotFoundException;
use Models\Message;

/**
 * Class Route
 * @package App\System
 */
class Route
{
    /**
     * Разбираем url на составные части и объявляем константу с ними
     * @param $uri
     * @throws NotFoundException
     */
    public static function parseUrl($uri)
    {
        $uri = explode('?', $uri)[0];
        $uri = mb_substr(trim($uri), 1, mb_strlen($uri) - 2);
        $parts  = explode('/', $uri);
        $routes = [];
        $urls = [];
        $link = '';

        if (!empty($parts[0]) && mb_strtolower(mb_substr($parts[0], 0, 1)) === 'v' && is_numeric(mb_substr($parts[0], 1))) {
            define('API_VERSION', $parts[0]);
            unset($parts[0]);
        } else throw new NotFoundException('Not found', 404);

        foreach ($parts as $part) {
            $elem = ucfirst(str_replace('-', '_', $part));
            $link .= ($link ? '/' : '') . str_replace('-', '_', $part);

            if (!empty($elem)) {
                $routes[] = $elem;

                $urls[] = [
                    'name' => $elem,
                    'link' => $link
                ];
            }
        }

        define('ROUTE', $routes); // ['Catalog', 'Conditioners', 'Mobile', '335']
        define('URL', $urls); // [['name' => 'Personal', 'link' => 'personal'], ['name' => 'Subscriptions', 'link' => 'personal/subscriptions']]
    }

    /**
     * @throws NotFoundException
     */
    public static function startApi()
    {
        $class  = null;  // класс контроллера
        $action = null;  // метод контроллера
        $param1  = null; // параметр1 метода
        $param2  = null; // параметр2 метода
        $route  = ROUTE; // массив роутов

        if (!empty($route[0])) {
            $baseController = 'Controllers' . '\\' . API_VERSION . '\\' . $route[0];
            $action = 'actionDefault';

            $subClass = match (true) {
                Request::isGet() => 'Read',
                Request::isPost() => 'Create',
                Request::isPut() => 'Update',
                Request::isDelete() => 'Delete',
                Request::isPatch() => 'Patch',
                default => '',
            };

            switch (count($route)) {
                case 4:
                    if (class_exists($baseController . '\\' . $route[1] . '\\' . $route[2] . '\\' . $route[3])) {
                        $class = $baseController . '\\' . $route[1] . '\\' . $route[2] . '\\' . $route[3];
                    }
                    elseif (class_exists($baseController . '\\' . $route[1] . '\\' . $route[2] . '\\' . $route[3] . '\\' . $subClass)) {
                        $class = $baseController . '\\' . $route[1] . '\\' . $route[2] . '\\' . $route[3] . '\\' . $subClass;
                    }
                    elseif (class_exists($baseController . '\\' . $route[1] . '\\' . $route[2])) {
                        $class = $baseController . '\\' . $route[1] . '\\' . $route[2];
                        $param1 = $route[3];
                    }
                    elseif (class_exists($baseController . '\\' . $route[1] . '\\' . $route[2] . '\\' . $subClass)) {
                        $class = $baseController . '\\' . $route[1] . '\\' . $route[2] . '\\' . $subClass;
                        $param1 = $route[3];
                    }
                    elseif (class_exists($baseController . '\\' . $route[1] . '\\' . $route[3])) {
                        $class = $baseController . '\\' . $route[1] . '\\' . $route[3];
                        $param1 = $route[2];
                    }
                    elseif (class_exists($baseController . '\\' . $route[1] . '\\' . $route[3] . '\\' . $subClass)) {
                        $class = $baseController . '\\' . $route[1] . '\\' . $route[3] . '\\' . $subClass;
                        $param1 = $route[2];
                    }
                    elseif (class_exists($baseController . '\\' . $route[1])) {
                        $class = $baseController . '\\' . $route[1];
                        $param1 = $route[2];
                        $param2 = $route[3];
                    }
                    elseif (class_exists($baseController . '\\' . $route[1] . '\\' . $subClass)) {
                        $class = $baseController . '\\' . $route[1] . '\\' . $subClass;
                        $param1 = $route[2];
                        $param2 = $route[3];
                    }
                    elseif (class_exists($baseController . '\\' . $route[2])) {
                        $class = $baseController . '\\' . $route[2];
                        $param1 = $route[1];
                        $param2 = $route[3];
                    }
                    elseif (class_exists($baseController . '\\' . $route[2] . '\\' . $subClass)) {
                        $class = $baseController . '\\' . $route[2] . '\\' . $subClass;
                        $param1 = $route[1];
                        $param2 = $route[3];
                    }
                    break;
                case 3:
                    if (class_exists($baseController . '\\' . $route[1] . '\\' . $route[2])) {
                        $class = $baseController . '\\' . $route[1] . '\\' . $route[2];
                    }
                    elseif (class_exists($baseController . '\\' . $route[1] . '\\' . $route[2] . '\\' . $subClass)) {
                        $class = $baseController . '\\' . $route[1] . '\\' . $route[2] . '\\' . $subClass;
                    }
                    elseif (class_exists($baseController . '\\' . $route[1])) {
                        $class = $baseController . '\\' . $route[1];
                        $param1 = $route[2];
                    }
                    elseif (class_exists($baseController . '\\' . $route[1] . '\\' . $subClass)) {
                        $class = $baseController . '\\' . $route[1] . '\\' . $subClass;
                        $param1 = $route[2];
                    }
                    elseif (class_exists($baseController)) {
                        $class = $baseController;
                        $param1 = $route[1];
                        $param2 = $route[2];
                    }
                    elseif (class_exists($baseController . '\\' . $subClass)) {
                        $class = $baseController . '\\' . $subClass;
                        $param1 = $route[1];
                        $param2 = $route[2];
                    }
                    break;
                case 2:
                    if (class_exists($baseController . '\\' . $route[1])) {
                        $class = $baseController . '\\' . $route[1];
                    }
                    elseif (class_exists($baseController . '\\' . $route[1] . '\\' . $subClass)) {
                        $class = $baseController . '\\' . $route[1] . '\\' . $subClass;
                    }
                    elseif (class_exists($baseController)) {
                        $class = $baseController;
                        $param1 = $route[1];
                    }
                    elseif (class_exists($baseController . '\\' . $subClass)) {
                        $class = $baseController . '\\' . $subClass;
                        $param1 = $route[1];
                    }
                    break;
                case 1:
                    if (class_exists($baseController)) {
                        $class = $baseController;
                    }
                    elseif (class_exists($baseController . '\\' . $subClass)) {
                        $class = $baseController . '\\' . $subClass;
                    }
                    break;
            }
        }

        if (!empty($class) && !empty($action) && method_exists($class, $action)) {
            $controller = new $class;

            if (!empty($param1) && !empty($param2))
                $controller->action($action, mb_strtolower($param1), mb_strtolower($param2));
            elseif (!empty($param1))
                $controller->action($action, mb_strtolower($param1));
            else
                $controller->action($action);

        } else {
            header('HTTP/1.1 404 Not Found', 404);
            throw new NotFoundException('Not found', 404);
        }
    }
}
