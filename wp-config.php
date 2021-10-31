<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress2021_gaulinelliot' );

/** MySQL database username */
define( 'DB_USER', 'patatefrite' );

/** MySQL database password */
define( 'DB_PASSWORD', 'apical1234' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'Q`<Dnd</(>n>;@L?+a%&1y;Z/FU0O7:1pZ-8/@,~Z5*u?8_-Se`FS4{&NsW~&O ]' );
define( 'SECURE_AUTH_KEY',  '[jpCqknq0-khT7vc3rQGmtZa@urj=-p.+G6Js-@o Yy~&_<33N8H O%^QwU3it,*' );
define( 'LOGGED_IN_KEY',    '_,~nAfp~#OdUyZh!<xF}M1P1>#$>W;Bb`^sZ,P,oS$t$6$g}kOzq9n9<HyXqW/3<' );
define( 'NONCE_KEY',        '_08xTtD]OkkPj k+U1saXBjME[5KEX5);QyjC1(VWtg>mg[?m0y7m+R`d)QKl|sa' );
define( 'AUTH_SALT',        '7Cs1i^Th@GQ1|3ZTp0`2|XCYk-}75wHl*dZ?w:9ZMlI}ha^|a3Jg,VC})$;L)s72' );
define( 'SECURE_AUTH_SALT', '(A$ZX~/^VI$1wre&W^3WQ`_=v)P 9vFw|s MKay$Y2 #Fx4niPJ&(%<.WxyDYdxS' );
define( 'LOGGED_IN_SALT',   'gTBm1~w|<UYy|xU2nUi$Z0i~TB}_ _4~oQGIT(HKPvBa,X{jE%@S+`7BI*Gb0Fhx' );
define( 'NONCE_SALT',       'LX~A{OmSARGMT2Hb;.Mzf!rJ9),@+ (bK,kC3P35/f-IOHpk3js6,&[._Ccv &`x' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'cegepvicto_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
// Active (true) ou désactive (false) le mode débogage
define( 'WP_DEBUG', true );

// Pendant le débogage, lorsqu'une erreur est rencontrée, n'affiche pas de message d'erreur.
// Plutôt, WordPress enverra un codes d'état HTTP 500 au navigateur.
define( 'WP_DEBUG_DISPLAY', true );

// Pendant le débogage, WordPress enregistrera les messages d'erreurs dans le fichier wp-content\debug.log.
define( 'WP_DEBUG_LOG', true );

// En production (lorsque WP_DEBUG est à false), n'affiche pas les erreurs à l'écran.
@ini_set( 'display_errors', '0' );
/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

const SMTP_HOST = 'mail.elliotgaulin.ca';
const SMTP_AUTH = true;
const SMTP_PORT     = '587';  // ou 465
const SMTP_SECURE   = 'tls';   // ou ssl
const SMTP_USERNAME = 'wordpress@elliotgaulin.ca';
const SMTP_PASSWORD = 'apical1234567';
const SMTP_FROM = 'wordpress@elliotgaulin.ca';
const SMTP_FROMNAME = 'Mon site Web';