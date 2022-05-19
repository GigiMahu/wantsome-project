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
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpadmin' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'db' );

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
define( 'AUTH_KEY',         'a`._~]EzrB!GR#&b>-_|S.-,qmk{.?YC@;N-gmfi8oYTm370|4S UJ!aG8vWxzZ.' );
define( 'SECURE_AUTH_KEY',  'G&(rd^?q}15OeuoZv/dWM>2I]z=K*c.9Tt=a5M}#2(uX};^6u#R(EE5&KR5@0*Y<' );
define( 'LOGGED_IN_KEY',    'DK#J6 n;aYEk)L|Ve{!jQ.Jq|*bm5y?W>F>QzCviPQkf0`ra[sa<ccM^-zZ/c@y!' );
define( 'NONCE_KEY',        'i;)eQPCdy6t4Y$YZ?s[>`T<rWy~e;z}zD$i17,bs_,`( )Hc@nw LdU9>OZMk^D[' );
define( 'AUTH_SALT',        '=rgd,[},;O0HZlM(^5b?=js&tU{_#Gd7~!csvV_9U-e)]Z6cEvq[P-LfR1q51 u.' );
define( 'SECURE_AUTH_SALT', 'XoZVc+YLf/N4,p.Sb7:><-c:*X:[]+jSwxG;3L1yM9F8d> C%U=Y/zemz)H5g]V=' );
define( 'LOGGED_IN_SALT',   'XSo$DL|x wPha,,[]A`j`<z_v`MK7`saez~GZO>W8xhcEQdi[RzFA+F+ cvXhTa3' );
define( 'NONCE_SALT',       'RLS1`D;AXiX|:IUie`U>DpoQPht/!?ln TG.e,Ufq+01rmz twu[8E4o3(w|Pc%f' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
