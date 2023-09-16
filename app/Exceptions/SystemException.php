<?php
namespace Exceptions;

use Throwable;
use System\Loggers\ErrorLogger;

/**
 * Class UserException
 * @package App\Exceptions
 */
class SystemException extends BaseException
{
    protected $code = 500;
    protected $message = 'System error';

    public function __construct($message = '', $code = 0, Throwable $previous = null)
    {
        parent::__construct($message, $code, $previous);
        ErrorLogger::getInstance()->error($this);
    }
}