class bacula::bconsole {

  package{$bconsole_pkgname:
    ensure => 'present',
  }

  file{"${::bacula::config_root}/bconsole.conf":
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('bacula/bconsole.conf.erb'),
    require => Package['bacula-console'],
  }

}
