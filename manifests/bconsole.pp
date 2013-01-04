class bacula::bconsole (
  $director_server   = $::bacula::params::director_server,
  $director_port     = $::bacula::params::director_port,
  $director_password = $::bacula::params::director_password,
){

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
