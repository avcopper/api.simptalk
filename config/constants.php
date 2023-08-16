<?php
use System\Config;

const _ROOT = __DIR__ . '/..';
const _APP = __DIR__ . '/../app';
const _CONFIG = __DIR__ . '/../config';
const _VENDOR = __DIR__ . '/../vendor';
const _LOGS = __DIR__ . '/../logs';
const _PUBLIC = __DIR__ . '/../public';
define("CONFIG", Config::getInstance()->data);
