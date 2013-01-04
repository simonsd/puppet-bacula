define bacula::catalog (
  $config_root     = $::bacula::params::config_root,
  $dbname          = $title,
  $dbuser          = $::bacula::params::dbuser,
  $dbpassword      = $::bacula::params::dbpassword,
  $dbhost          = $::bacula::params::dbhost,
  $db_init_command = $::bacula::params::db_init_command,
) {

  file{"${config_root}/catalog.d/${title}.conf":
    ensure  => 'file',
    content => template('bacula/catalog.conf.erb'),
  }

  exec{"Initialize catalog ${title}":
    command     => "${db_init_command} -u${dbuser} -p${dbpassword} -h${dbhost}",
    environment => "db_name=${dbname}",
    unless      => "/usr/bin/mysqlshow -u${dbuser} -p${dbpassword} -h${dbhost} ${dbname} | grep Version",
  }

}
