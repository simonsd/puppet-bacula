class bacula::director::install {

  package{'bacula-director-mysql':
    ensure   => 'latest',
    require  => Package['mysql-server'],
  }

  file{'/usr/sbin/bacula-dir.mysql':
    owner => 'root',
    group => 'root',
    mode  => '0755',
  }

}
