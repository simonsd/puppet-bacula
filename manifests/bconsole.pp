class bacula::bconsole {

  package{$bconsole_pkgname:
    ensure => 'present',
  }

  file{"${config_root}/bconsole.conf":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('bacula/bconsole.conf.erb'),
    require => Package[$bconsole_pkgname],
  }

}
