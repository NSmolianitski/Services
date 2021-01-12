<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define('DB_NAME', 'wordpress_db');

/** Имя пользователя MySQL */
define('DB_USER', 'root');

/** Пароль к базе данных MySQL */
define('DB_PASSWORD', 'root');

/** Имя сервера MySQL */
define('DB_HOST', 'mysql-service');

/** Кодировка базы данных для создания таблиц. */
define('DB_CHARSET', 'utf8');

/** Схема сопоставления. Не меняйте, если не уверены. */
define('DB_COLLATE', '');

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'L|Ut9LeyK|!.~ &}Zz&g8+C/TgI+4J>T%Z&ig!r&As~Gtn9:UBh/[>%h4F0UdEJA');
define('SECURE_AUTH_KEY',  '4s|#J=@$x|/b<B@({qt_B$n&}#D<bn)Zu5L&`gPCVh2Ep.&.xB(4L$d7Gn7D15:V');
define('LOGGED_IN_KEY',    'of~_kriw.ss5b]~qdD9t,seXT*+>fx1,!&i0G-KQ YwYOM=Mmt,vRP%-%Xyl7+M9');
define('NONCE_KEY',        '2lS;o9cJf,0Gzo]5V>B+M89ti&84Trk*.#q*`XrlP({9,pUYR=hbLHI[o/a_uuJA');
define('AUTH_SALT',        'S ?::V_|mCSjk|Bq6?(76)s&<`nS8mnlQjEP7x9O_?gnMy.MrW?,d.ezprh;I,$(');
define('SECURE_AUTH_SALT', 's!+!n@q;Y9=}R&Uoax5S|$kt>kD|-`e0Q[P&5Dx!}Y|5P+s^~ 1l`s<m5`Kqf+OZ');
define('LOGGED_IN_SALT',   '>-Y-kgZT`vYB4norAr:NB7+GP`vN;~a(h^xCCf|!.d#,.;bSpB^TwD8Jq-{dol a');
define('NONCE_SALT',       '4U`0C.#Emned2|R3E8^0H>|e<zWHlN74xm+1TDn7=o;Vh[5|8nrV0FeX7``Wfy]+');

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix  = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 *
 * Информацию о других отладочных константах можно найти в Кодексе.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Инициализирует переменные WordPress и подключает файлы. */
require_once(ABSPATH . 'wp-settings.php');