class bacula::director::install {

  package{$director_pkgname:
    ensure   => 'present',
  }

  file{'/usr/sbin/bacula-dir.mysql':
    owner => 'root',
    group => 'root',
    mode  => '0755',
  }

}
