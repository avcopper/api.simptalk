<?php
namespace Models;

use DateTime;
use System\Db;
use System\Auth;
use Exceptions\DbException;
use Exceptions\UserException;
use Models\User as ModelUser;

/**
 * Class User
 * @package App\Models
 */
class User extends Model
{
    const MAX_COUNT_ATTEMPT = 5;

    protected static $db_table = 'mesigo.users';

    public $id;
    public $active = true;
    public $blocked = false;
    public $group_id = 2; // группа "Пользователи"
    public $login;
    public $password;
    public $pin = null;
    public $e_pin = null;
    public $email = null;
    public $phone = null;
    public $name = null;
    public $second_name = null;
    public $last_name = null;
    public $gender_id = 1;
    public $personal_data_agreement = 1;
    public $mailing = null; // подписание на рассылку
    public $mailing_type_id = 2; // тип рассылки html
    public $created;
    public $updated = null;

    /**
     * Возвращает пользователя по id (!+)
     */
    public static function getById(int $id, bool $active = true, $object = false)
    {
        $db = Db::getInstance();
        $activity = !empty($active) ? 'AND u.active IS NOT NULL AND u.blocked IS NULL AND ub.expire IS NULL AND ug.active IS NOT NULL' : '';
        $db->params = ['id' => $id];
        $db->sql = "
            SELECT 
                u.id, u.active, u.blocked, ub.expire, u.group_id, ug.name group_name, u.login, u.password, u.pin, u.e_pin, u.email, u.phone, 
                u.name,  u.second_name, u.last_name, u.gender_id, ugn.name gender, u.personal_data_agreement, u.mailing, 
                u.mailing_type_id, tt.name mailing_type, u.created, u.updated
            FROM " . self::$db_prefix . self::$db_table . " u 
            LEFT JOIN " . self::$db_prefix . "mesigo.user_groups ug ON u.group_id = ug.id 
            LEFT JOIN " . self::$db_prefix . "mesigo.user_genders ugn ON u.gender_id = ugn.id 
            LEFT JOIN " . self::$db_prefix . "mesigo.text_types tt ON u.mailing_type_id = tt.id 
            LEFT JOIN " . self::$db_prefix . "mesigo.user_blocks ub ON u.id = ub.user_id AND ub.expire > NOW() 
            WHERE u.id = :id {$activity}";

        $data = $db->query($object ? static::class : null);
        return !empty($data) ? array_shift($data) : null;
    }

    /**
     * Возвращает пользователя по логину (!+)
     */
    public static function getByLogin(string $login, bool $active = true, $object = false)
    {
        $db = Db::getInstance();
        $activity = !empty($active) ? 'AND u.active IS NOT NULL AND u.blocked IS NULL AND ub.expire IS NULL AND ug.active IS NOT NULL' : '';
        $db->params = ['login' => $login];
        $db->sql = "
            SELECT 
                u.id, u.active, u.blocked, u.group_id, ug.name group_name, u.login, u.password, u.pin, u.e_pin, u.email, u.phone, 
                u.name,  u.second_name, u.last_name, u.gender_id, ugn.name gender, u.personal_data_agreement, u.mailing, 
                u.mailing_type_id, tt.name mailing_type, u.created, u.updated
            FROM " . self::$db_prefix . self::$db_table . " u 
            LEFT JOIN " . self::$db_prefix . "mesigo.user_groups ug ON u.group_id = ug.id 
            LEFT JOIN " . self::$db_prefix . "mesigo.user_genders ugn ON u.gender_id = ugn.id 
            LEFT JOIN " . self::$db_prefix . "mesigo.text_types tt ON u.mailing_type_id = tt.id 
            LEFT JOIN " . self::$db_prefix . "mesigo.user_blocks ub ON u.id = ub.user_id AND ub.expire > NOW() 
            WHERE u.login = :login {$activity}";

        $data = $db->query($object ? static::class : null);
        return !empty($data) ? array_shift($data) : null;
    }

    /**
     * Возвращает пользователя по токену (!+)
     */
    public static function getByToken(?string $token, bool $active = true, bool $object = false)
    {
        if ($token === null) return null;

        $db = Db::getInstance();
        $activity = !empty($active) ? 'AND u.active IS NOT NULL AND u.blocked IS NULL AND ub.expire IS NULL AND ug.active IS NOT NULL AND us.expire > NOW()' : '';
        $db->params = ['token' => $token];
        $db->sql = "
            SELECT 
                u.id, u.active, u.blocked, u.group_id, ug.name group_name, u.login, u.password, u.pin, u.e_pin, u.email, u.phone, 
                u.name,  u.second_name, u.last_name, u.gender_id, ugn.name gender, u.personal_data_agreement, u.mailing, 
                u.mailing_type_id, tt.name mailing_type, u.created, u.updated
            FROM " . self::$db_prefix . "users.user_sessions us 
            LEFT JOIN " . self::$db_prefix . self::$db_table . " u ON us.login = u.login 
            LEFT JOIN " . self::$db_prefix . "mesigo.user_groups ug ON u.group_id = ug.id 
            LEFT JOIN " . self::$db_prefix . "mesigo.user_genders ugn ON u.gender_id = ugn.id 
            LEFT JOIN " . self::$db_prefix . "mesigo.text_types tt ON u.mailing_type_id = tt.id 
            LEFT JOIN " . self::$db_prefix . "mesigo.user_blocks ub ON u.id = ub.user_id AND ub.expire > NOW() 
            WHERE us.token = :token {$activity}";

        $data = $db->query($object ? static::class : null);
        return !empty($data) ? array_shift($data) : null;
    }

    /**
     * Возвращает авторизационный токен из тела запроса (+++)
     * @return mixed
     */
    public static function getRequestToken()
    {
        if (empty($_SERVER['HTTP_AUTHORIZATION']) ||
            !preg_match('/Bearer\s(\S+)/', $_SERVER['HTTP_AUTHORIZATION'], $matches) ||
            empty($matches[1]))
        {
            return null;
        }

        return $matches[1];
    }

    /**
     * Возвращает данные пользовательского устройства из запроса к апи (+++)
     * @return mixed
     * @throws UserException
     */
    public static function getUserDeviceFromApi()
    {
        $userData = json_decode(file_get_contents("php://input"), true);
        if (empty($userData)) throw new UserException(Auth::EMPTY_REQUEST);
        $user = !empty($userData['user']) ? User::getUserFromApi($userData) : [];
        return $userData + $user;
    }

    /**
     * Возвращает данные пользователя из запроса
     * @param $userData
     * @return array
     */
    public static function getUserFromApi($userData)
    {
        $user = explode(':', base64_decode($userData['user']));
        return [
           'login' => $user[0] ?? null,
           'password' => $user[1] ?? null
        ];
    }

    /**
     * Проверяет авторизован ли пользователь (+++)
     * @return bool
     * @throws UserException
     */
    public static function isAuthorized()
    {
        $token = self::getRequestToken();
        $device = self::getUserDeviceFromApi();
        if (empty($token) || empty($device)) return false;

        return Auth::checkAuthorization($token, $device);
    }

    /**
     * Авторизация (+++)
     * @param string $login - логин
     * @param string $password - пароль
     * @param array $userData - пользовательское устройство
     * @throws UserException|DbException
     */
    public static function authorize(string $login, string $password, $userData = [])
    {
        Auth::checkUser($login, $password);
        Auth::checkDeviceData($userData);

        $auth = new Auth();
        $auth->user = \Entity\User::get(['login' => $login]);

        if (!empty($auth->user->id)) { // найден активный пользователь
            $auth->userSession = self::setUserSession($auth->user, $userData);
            $countFailedAttempts = UserSession::getCountFailedAttempts($login);

            if ($countFailedAttempts < ModelUser::MAX_COUNT_ATTEMPT) { // меньше 5 активных попыток входа

                if (password_verify($password, $auth->user->ePin) && $userData['serviceId'] === UserSession::SERVICE_MOBILE)
                {
                    $auth->loginEmergencyPin();
                }

                elseif (password_verify($password, $auth->user->pin) && $userData['serviceId'] === UserSession::SERVICE_MOBILE &&
                    Auth::checkAuthorization(User::getRequestToken(), $userData)) $auth->loginPin();

                elseif (password_verify($password, $auth->user->password)) $auth->login();

                else {
                    $auth->userSession->comment = Auth::WRONG_LOGIN_PASSWORD;
                    $auth->userSession->save();
                    throw new UserException(Auth::WRONG_LOGIN_PASSWORD, 401);
                }

            }
            else {
                UserSession::clearFailedAttempts($auth->user->login);
                $auth->user->block(UserBlock::INTERVAL_DAY, Auth::TOO_MANY_FAILED_ATTEMPTS);
                throw new UserException(Auth::TOO_MANY_FAILED_ATTEMPTS, 401);
            }
        };

        throw new UserException(Auth::USER_NOT_FOUND, 401);
    }

    /**
     * Создает пользовательскую сессию (+++)
     * @param $user
     * @param $userData
     * @return \Entity\UserSession
     */
    protected static function setUserSession($user, $userData)
    {
        $userSession = new \Entity\UserSession();
        $userSession->isActive = 1;
        $userSession->login = $user->login;
        $userSession->userId = $user->id;
        $userSession->serviceId = $userData['serviceId'];
        $userSession->ip = base64_decode($userData['ip']);
        $userSession->device = base64_decode($userData['device']);
        $userSession->logIn = new DateTime();
        $userSession->expire = null;
        $userSession->token = null;
        $userSession->comment = null;
        return $userSession;
    }
}
