class bacula::director::config {

  file{"${::bacula::config_root}/clients.d":
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  file{"${::bacula::config_root}/filesets.d":
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  file{"${::bacula::config_root}/schedules.d":
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  file{"${::bacula::config_root}/jobdefs.d":
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  file{"${::bacula::config_root}/pools.d":
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  file{"${::bacula::config_root}/bacula-dir.conf":
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['bacula-director-mysql'],
    notify  => Service['bacula-dir'],
    content => template('bacula/bacula-dir.conf.erb'),
  }

  mysql::db{$::bacula::dbname:
    user => $::bacula::dbuser,
    host => $::bacula::dbhost,
  }

  exec{'bacula-db-tables':
    command     => $::operatingsystem ? {
      centos => "/usr/libexec/bacula/make_bacula_tables -u${::bacula::dbuser} -p${::bacula::dbpassword}",
      debian => "/usr/share/bacula-director/make_mysql_tables -u${::bacula::dbuser} -p${::bacula::dbpassword}",
    },
    environment => "db_name=${::bacula::dbname}",
    subscribe   => Package['bacula-director-mysql'],
    require     => Mysql::Db[$::bacula::dbname],
    unless      => "/usr/bin/mysqlshow -uroot -p${::bacula::dbpassword} ${::bacula::dbname} | grep Version",
    before      => Service['bacula-dir'],
  }

}
