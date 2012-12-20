class bacula::director::config {

  File{
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  file{"${::bacula::config_root}/clients.d":}
  file{"${::bacula::config_root}/filesets.d":}
  file{"${::bacula::config_root}/schedules.d":}
  file{"${::bacula::config_root}/jobdefs.d":}
  file{"${::bacula::config_root}/pools.d":}

  file{"${::bacula::config_root}/bacula-dir.conf":
    ensure  => 'file',
    content => template('bacula/bacula-dir.conf.erb'),
    notify  => Service[$director_service],
  }

  file{"${log_dir}/bacula-dir.log":
    ensure => 'file',
    mode   => '0644',
  }

  mysql::db{$::bacula::dbname:
    user => $::bacula::dbuser,
    host => $::bacula::dbhost,
  }

  exec{'initialize database':
    command     => "${::bacula::params::db_init_command} -u${::bacula::dbuser -p${::bacula::dbpassword}",
    environment => "db_name=${::bacula::dbname}",
    unless      => "/usr/bin/mysqlshow -uroot -p${::bacula::dbpassword} ${::bacula::dbname} | grep Version",
  }

}
