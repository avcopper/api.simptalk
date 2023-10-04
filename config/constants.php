<?php
use System\Config;

const DIR_ROOT = __DIR__ . DIRECTORY_SEPARATOR . '..';
const DIR_APP = DIR_ROOT . DIRECTORY_SEPARATOR . 'app';
const DIR_CONFIG = DIR_ROOT . DIRECTORY_SEPARATOR . 'config';
const DIR_VENDOR = DIR_ROOT . DIRECTORY_SEPARATOR . 'vendor';
const DIR_LOGS = DIR_ROOT . DIRECTORY_SEPARATOR . 'logs';
const DIR_PUBLIC = DIR_ROOT . DIRECTORY_SEPARATOR . 'public';
const DIR_CERTIFICATES = DIR_ROOT . DIRECTORY_SEPARATOR . 'certificates';
define("CONFIG", Config::getInstance()->data);