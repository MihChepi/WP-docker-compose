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
define('DB_NAME', 'wordpress');
/** Имя пользователя MySQL */
define('DB_USER', {DB_USER});

/** Пароль к базе данных MySQL */
define('DB_PASSWORD', {DB_PASSWORD});

/** Имя сервера MySQL */
define('DB_HOST', 'mariadb'); #env

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

define( 'WP_HOME', 'https://{WP_HOME}');
define( 'WP_SITEURL', 'https://{WP_SITEURL}');
define('AUTH_KEY',         'H37`).p71%kF4n4K#Y`X!_Yr/a?p{/?NM9koMAD1]Sa.{yV-kBMuWK)U8kMf]Au6');
define('SECURE_AUTH_KEY',  'zkA@>vqqKNv9x.H^{<4(&t1.TsY`&g 8EOH*jbkztr]i6N0%]-vIK3v2[+Ii^cJJ');
define('LOGGED_IN_KEY',    't*J`~l [B,Q~3P1)%{VRRJt<2UD/Y,lc<L-W7cI}sX84/Iw2hPzP):Q=D}rUopRU');
define('NONCE_KEY',        'eE2Fx-Z>!&.j|,/B.+jc[[A57H4YB~KX=1^::m*5$`0/L%!qh~I$o>0!csY9)|}i');
define('AUTH_SALT',        'yqK65~XnK`U;+&%/c$Q&wz^8P!MV@3uH70H_+qhG_&bRGxi)_[27r7xVK gX:g-m');
define('SECURE_AUTH_SALT', '/1FU&YAP}V$5:b):gvC%7QlwgK+0<BT%yxpWkn8KVgDr~VW66u$KZsy.{-6&P3A<');
define('LOGGED_IN_SALT',   'Ue+JxzL=M1AwcY2g.$giQ7o$8d*b%=vYKz08y,+1S[~QUs}`|SXtk2ws5_m]pVd?');
define('NONCE_SALT',       'yf%?GR)&]/!x(GAe]fF8R Ym%4?-x1e-#=8W?V(+,SkQZX%faxq:osi+k GHfx+9');

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
