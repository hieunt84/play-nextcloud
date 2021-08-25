<?php
$CONFIG = array (
  'htaccess.RewriteBase' => '/',
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'apps_paths' => 
  array (
    0 => 
    array (
      'path' => '/var/www/html/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 => 
    array (
      'path' => '/var/www/html/custom_apps',
      'url' => '/custom_apps',
      'writable' => true,
    ),
  ),
  'memcache.distributed' => '\\OC\\Memcache\\Redis',
  'memcache.locking' => '\\OC\\Memcache\\Redis',
  'redis' => 
  array (
    'host' => 'redis',
    'password' => '',
    'port' => 6379,
  ),
  'instanceid' => 'ocyisju3shja',
  'passwordsalt' => 'qFFNsBGWS+FdH8Calcpi78vxbr8qeZ',
  'secret' => 'E3OGcnC0sa2hCj6VqKQCgAxu6MU+Q43Qjdh2V/Qd9Pmjf5RF',
  'trusted_domains' => 
  array (
    0 => 'test.phuthinhtravel.vn',
  ),
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'mysql',
  'version' => '22.1.0.1',
  'overwrite.cli.url' => 'http://test.phuthinhtravel.vn',
  'dbname' => 'nextcloud',
  'dbhost' => 'db',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'nextcloud',
  'dbpassword' => '"Abcqwe123@"',
  'installed' => true,
  'overwriteprotocol' => 'https',
);