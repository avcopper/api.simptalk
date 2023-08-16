-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 16 2023 г., 22:07
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `talk_auth`
--

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int NOT NULL,
  `active` tinyint DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `active`, `name`, `created`, `updated`) VALUES
(1, 1, 'mobile', '2023-02-10 21:29:37', '2023-02-10 22:29:20'),
(2, 1, 'site', '2023-02-10 21:29:37', '2023-02-10 22:29:20');

-- --------------------------------------------------------

--
-- Структура таблицы `text_types`
--

CREATE TABLE `text_types` (
  `id` int NOT NULL,
  `active` tinyint DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `sort` smallint NOT NULL DEFAULT '500',
  `careated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `text_types`
--

INSERT INTO `text_types` (`id`, `active`, `name`, `sort`, `careated`, `updated`) VALUES
(1, 1, 'text', 500, '2023-08-15 18:55:29', '2023-08-15 19:54:57'),
(2, 1, 'html', 500, '2023-08-15 18:55:29', '2023-08-15 19:54:57');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `active` tinyint DEFAULT NULL,
  `blocked` int DEFAULT NULL,
  `group_id` int NOT NULL DEFAULT '2',
  `login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `e_pin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `second_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender_id` int DEFAULT '1',
  `personal_data_agreement` int DEFAULT NULL,
  `mailing` tinyint DEFAULT '1',
  `mailing_type_id` int NOT NULL DEFAULT '2',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `active`, `blocked`, `group_id`, `login`, `password`, `pin`, `e_pin`, `email`, `phone`, `name`, `second_name`, `last_name`, `gender_id`, `personal_data_agreement`, `mailing`, `mailing_type_id`, `created`, `updated`) VALUES
(1, 1, NULL, 1, 'andrew', '$2y$10$B2ZpFaVQxJxj/Uf66P6aIezwlctaOcNF4VTP/.AeLuHsHL8zVqakW', '$2y$10$vmpAumh/ZwiK5wLQxOodGu9MqRlEmvzBbDu8HuG.Bf02haDQCfuS2', '$2y$10$bRvO2k7.q7/28Yamy.wjveQIpUwVU8piVSJEl1c/56EYf/HXtZNo6', 'an359747@gmail.com', NULL, 'Andrew', NULL, 'Cooper', 1, 1, 1, 1, '2023-02-09 22:46:21', '2023-04-06 21:41:11');

-- --------------------------------------------------------

--
-- Структура таблицы `user_blocks`
--

CREATE TABLE `user_blocks` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `expire` datetime NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user_blocks`
--

INSERT INTO `user_blocks` (`id`, `user_id`, `expire`, `reason`, `created`, `updated`) VALUES
(1, 1, '2023-03-14 23:03:28', 'PIN', '2023-03-14 22:20:08', '2023-03-14 23:19:25'),
(2, 1, '2000-01-01 00:00:00', 'Введен emergency PIN', '2023-03-15 22:51:11', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_genders`
--

CREATE TABLE `user_genders` (
  `id` int NOT NULL,
  `active` tinyint DEFAULT NULL,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user_genders`
--

INSERT INTO `user_genders` (`id`, `active`, `name`, `created`, `updated`) VALUES
(1, 1, 'мужской', '2023-02-09 22:47:56', '2023-02-09 23:47:32'),
(2, 1, 'женский', '2023-02-09 22:47:56', '2023-02-09 23:47:32');

-- --------------------------------------------------------

--
-- Структура таблицы `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int NOT NULL,
  `active` tinyint DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user_groups`
--

INSERT INTO `user_groups` (`id`, `active`, `name`, `created`, `updated`) VALUES
(1, 1, 'Администраторы', '2023-02-09 22:30:40', '2023-02-09 23:29:54'),
(2, 1, 'Пользователи', '2023-02-09 22:30:40', '2023-02-09 23:29:54');

-- --------------------------------------------------------

--
-- Структура таблицы `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` int NOT NULL,
  `active` tinyint DEFAULT NULL,
  `login` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `service_id` int NOT NULL,
  `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `device` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `log_in` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expire` datetime DEFAULT NULL,
  `token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user_sessions`
--

INSERT INTO `user_sessions` (`id`, `active`, `login`, `user_id`, `service_id`, `ip`, `device`, `log_in`, `expire`, `token`, `comment`) VALUES
(59, 1, 'andrew', 1, 1, '192.168.0.11|FE80::319D:C5C1:155C:F619', 'Xiaomi|Redmi|M2006C3MNG|angelican_ru|angelican|10|29|QP1A.190711.020|V12.0.14.0.QCSRUXM|user|QP1A.190711.020|mt6765|c4-miui-ota-bd128.bj|release-keys|2022-06-01', '2023-08-15 20:07:46', '2023-08-16 20:07:46', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjEwNDg2NiwibmJmIjoxNjkyMTA0ODY2LCJleHAiOjE2OTIxOTEyNjYsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MSwiaXAiOiIxOTIuMTY4LjAuMTF8RkU4MDo6MzE5RDpDNUMxOjE1NUM6RjYxOSIsImRldmljZSI6IlhpYW9taXxSZWRtaXxNMjAwNkMzTU5HfGFuZ2VsaWNhbl9ydXxhbmdlbGljYW58MTB8Mjl8UVAxQS4xOTA3MTEuMDIwfFYxMi4wLjE0LjAuUUNTUlVYTXx1c2VyfFFQMUEuMTkwNzExLjAyMHxtdDY3NjV8YzQtbWl1aS1vdGEtYmQxMjguYmp8cmVsZWFzZS1rZXlzfDIwMjItMDYtMDEiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE2IDIwOjA3OjQ2LjcwNzAzNyIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.fPJu8BUh9T0OGRNvQdLtxsWzIhNxkK8_-0ZQluud7YMUMXuiqVh2K7_08XpYEYsZl50B4wGzENHqoA3WIt-CfA', 'Password entered'),
(60, 1, 'andrew', 1, 1, '192.168.0.11|FE80::319D:C5C1:155C:F619', 'Xiaomi|Redmi|M2006C3MNG|angelican_ru|angelican|10|29|QP1A.190711.020|V12.0.14.0.QCSRUXM|user|QP1A.190711.020|mt6765|c4-miui-ota-bd128.bj|release-keys|2022-06-01', '2023-08-15 20:08:24', '2023-08-16 20:08:24', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjEwNDkwNCwibmJmIjoxNjkyMTA0OTA0LCJleHAiOjE2OTIxOTEzMDQsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MSwiaXAiOiIxOTIuMTY4LjAuMTF8RkU4MDo6MzE5RDpDNUMxOjE1NUM6RjYxOSIsImRldmljZSI6IlhpYW9taXxSZWRtaXxNMjAwNkMzTU5HfGFuZ2VsaWNhbl9ydXxhbmdlbGljYW58MTB8Mjl8UVAxQS4xOTA3MTEuMDIwfFYxMi4wLjE0LjAuUUNTUlVYTXx1c2VyfFFQMUEuMTkwNzExLjAyMHxtdDY3NjV8YzQtbWl1aS1vdGEtYmQxMjguYmp8cmVsZWFzZS1rZXlzfDIwMjItMDYtMDEiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE2IDIwOjA4OjI0Ljk0MjI3MiIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.fPP1u2iEqkiDyNmTkrdeN8Ham1rEdx-diW7pAyYHCbTno86hj1ArGnIepTj3ozNn4WuvjGQSuk64orDH8lIeTA', 'Password entered'),
(61, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 01:53:57', '2023-08-17 01:53:57', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjEyNTYzNywibmJmIjoxNjkyMTI1NjM3LCJleHAiOjE2OTIyMTIwMzcsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDAxOjUzOjU3LjQyNjMyOCIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.J-gLv0CebWRYXFZPH8UrdNP2sCFALHwmZScLlStt3qfrliycQKnUw-AdkNoiXegPczVJmBz_1ZZ5aemyKBdvWA', 'Password entered'),
(62, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 13:18:01', '2023-08-17 13:18:01', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE2NjY4MSwibmJmIjoxNjkyMTY2NjgxLCJleHAiOjE2OTIyNTMwODEsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDEzOjE4OjAxLjg5ODcyOCIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.Dv_rA54cEpKgg1JQLxnpGn5AqLbBhjv_6dMU64ExZjQkZvbDFiMgBy-jWQ8rNKtX116UtR4OSxub7p-S03v2sw', 'Password entered'),
(63, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 13:39:35', '2023-08-17 13:39:36', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE2Nzk3NiwibmJmIjoxNjkyMTY3OTc2LCJleHAiOjE2OTIyNTQzNzYsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDEzOjM5OjM2LjAxOTc0NSIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.lqotZ07XqcdQ9Zmf5q4bhnyfUnf4Mt8T24P9jVWhvmLdEILGuO44NNnUsE3BjTx5E_x1tQbFtlh-FJbyfnBC_w', 'Password entered'),
(64, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 13:46:21', '2023-08-17 13:46:21', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE2ODM4MSwibmJmIjoxNjkyMTY4MzgxLCJleHAiOjE2OTIyNTQ3ODEsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDEzOjQ2OjIxLjQ1NzM0MSIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.YduIjN-4b4zJCeRCR4HqpFhUzQb6hfs0gZLlqDZWYCZjmNE9sQlUGA11AG5QHnQMeUJL8_lVhHiUqVlzLhxNSQ', 'Password entered'),
(65, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 13:47:42', '2023-08-17 13:47:42', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE2ODQ2MiwibmJmIjoxNjkyMTY4NDYyLCJleHAiOjE2OTIyNTQ4NjIsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDEzOjQ3OjQyLjM1MzAxMSIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.SM19Nu4XyRutjF4_AnAMDcQnt_k8YHQMAZxkA59AQ9zPHwn7ljeHBFABxI3ChGhjrNLXdQeWQZ8MihJOl9nXxA', 'Password entered'),
(66, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 13:54:32', '2023-08-17 13:54:33', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE2ODg3MywibmJmIjoxNjkyMTY4ODczLCJleHAiOjE2OTIyNTUyNzMsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDEzOjU0OjMzLjE2NTA3NSIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.oN_Z0N6z6QFlxO1rY6Qz5K9VIEPVM37vC41ZVWl3TSjdMVBkWZ-E_H8WfJMX1xZCWyIt2Bn2PS37Yl4MjELmZQ', 'Password entered'),
(67, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 13:55:44', '2023-08-17 13:55:44', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE2ODk0NCwibmJmIjoxNjkyMTY4OTQ0LCJleHAiOjE2OTIyNTUzNDQsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDEzOjU1OjQ0LjUwMTA4NiIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.EvVGEUtKedj8_Kthv_sThw8fOHQIzTpyCarXT4_LqVvrw3cxxw1T_44xb0oz_eQF84H-sqJ-FpfGDuEYVydM0Q', 'Password entered'),
(68, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 13:58:35', '2023-08-17 13:58:35', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE2OTExNSwibmJmIjoxNjkyMTY5MTE1LCJleHAiOjE2OTIyNTU1MTUsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDEzOjU4OjM1LjUxNDYzNSIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.gPcCHIHYSuC8HIIa9hZSV8mS6wGGalczF7EYeNsrQof77ed5SLjmrfyCoorbEWr0lG-PwessHR1VtNKzfuKvFQ', 'Password entered'),
(69, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 14:54:45', '2023-08-17 14:54:45', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE3MjQ4NSwibmJmIjoxNjkyMTcyNDg1LCJleHAiOjE2OTIyNTg4ODUsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDE0OjU0OjQ1LjM5ODU3MCIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.LTFAfw0mh0Sk3psXdzWajo77d3viDeyUnSAO6414_JaX_UVGRIDyjO4cQv0E60fAqMN_J1TMCYdKyYNKJkQGNQ', 'Password entered'),
(70, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 14:59:38', '2023-08-17 14:59:38', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE3Mjc3OCwibmJmIjoxNjkyMTcyNzc4LCJleHAiOjE2OTIyNTkxNzgsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDE0OjU5OjM4LjI0ODA5NyIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.UjlXlMyR8iFIzJ1PKzCIOocumvobGgfdEivHyzo6UlRsb0TJmiqqz923Sc4zn-baWkpv1RlGrGQA0QIpYcG2dw', 'Password entered'),
(71, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 15:00:45', '2023-08-17 15:00:45', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE3Mjg0NSwibmJmIjoxNjkyMTcyODQ1LCJleHAiOjE2OTIyNTkyNDUsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDE1OjAwOjQ1LjczMjE3NiIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.GisETy2ZN8h-GEqkPyO6dQzIobbN6o6rxD7dEl5AZgRybBLiLZ5Ps7EIe6Y-SA3Dr7-S1YSKbliTiVOK3zejpw', 'Password entered'),
(72, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 15:12:36', '2023-08-17 15:12:36', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE3MzU1NiwibmJmIjoxNjkyMTczNTU2LCJleHAiOjE2OTIyNTk5NTYsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDE1OjEyOjM2Ljc1NjIwMiIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.5lzG4qClUwQQxhWa-caU9GEPi3Das7QpB1f4zD_5HI1M4Q9ykXCnLr0bRnpxJUNMB_CNw5lUpDjd3M3jO3UStQ', 'Password entered'),
(73, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 15:13:27', '2023-08-17 15:13:27', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE3MzYwNywibmJmIjoxNjkyMTczNjA3LCJleHAiOjE2OTIyNjAwMDcsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDE1OjEzOjI3LjQ5ODkzMiIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.K0I8TFsW4mmMqND0CDchHkufvCSW_Wczytu1OA-8jpv4fRI-em30-C3pkvgnsRPqym2HxCHTnIr24HEmSdITtg', 'Password entered'),
(74, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 19:20:08', '2023-08-17 19:20:09', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE4ODQwOSwibmJmIjoxNjkyMTg4NDA5LCJleHAiOjE2OTIyNzQ4MDksImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDE5OjIwOjA5LjA1MDk2OCIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.e6XdLDbSGs2Bs6TTkAIBtHLyAnBMk4J1mSDFet9tK9QIYUQ7VHIcdrC6yWj37uOokYUHGpYbFSMBAx2UINoUYg', 'Password entered'),
(75, 1, 'andrew', 1, 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', '2023-08-16 21:35:28', '2023-08-17 21:35:28', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzaW1wdGFsayIsImF1ZCI6ImFuZHJldyIsImlhdCI6MTY5MjE5NjUyOCwibmJmIjoxNjkyMTk2NTI4LCJleHAiOjE2OTIyODI5MjgsImRhdGEiOnsiaWQiOjEsInNlcnZpY2VJZCI6MiwiaXAiOiIxMjcuMC4wLjEiLCJkZXZpY2UiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTE1LjAuMC4wIFNhZmFyaS81MzcuMzYiLCJleHBpcmVkIjp7ImRhdGUiOiIyMDIzLTA4LTE3IDIxOjM1OjI4LjU5MjgzOSIsInRpbWV6b25lX3R5cGUiOjMsInRpbWV6b25lIjoiQXNpYS9Ob3Zvc2liaXJzayJ9fX0.rpDKx35QF0ZYDOR5fjVZWK01ZJK0rUcSMhBERY9xiTVS2OiqZw3jXgV4a8jjWLU6mg4ZN_yER5-gFhT9RsKrDQ', 'Password entered');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `text_types`
--
ALTER TABLE `text_types`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_gender_id_genders_id` (`gender_id`),
  ADD KEY `fk_users_id_user_groups_id` (`group_id`),
  ADD KEY `fk_users_mailing_type_id_text_types_id` (`mailing_type_id`);

--
-- Индексы таблицы `user_blocks`
--
ALTER TABLE `user_blocks`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_user_blocks_user_id_users_id` (`user_id`);

--
-- Индексы таблицы `user_genders`
--
ALTER TABLE `user_genders`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `user_groups`
--
ALTER TABLE `user_groups`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_user_sessions_user_id_users_id` (`user_id`),
  ADD KEY `fk_user_sessions_service_id_services_id` (`service_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `text_types`
--
ALTER TABLE `text_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `user_blocks`
--
ALTER TABLE `user_blocks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `user_genders`
--
ALTER TABLE `user_genders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_gender_id_genders_id` FOREIGN KEY (`gender_id`) REFERENCES `user_genders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_users_id_user_groups_id` FOREIGN KEY (`group_id`) REFERENCES `user_groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_users_mailing_type_id_text_types_id` FOREIGN KEY (`mailing_type_id`) REFERENCES `text_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `user_blocks`
--
ALTER TABLE `user_blocks`
  ADD CONSTRAINT `fk_user_blocks_user_id_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `fk_user_sessions_service_id_services_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_user_sessions_user_id_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
