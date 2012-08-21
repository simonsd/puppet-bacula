define bacula::device (
  $path
){

  file {$path:
    ensure => directory,
  }

  file {"/etc/bacula/devices.d/${name}.conf":
    ensure  => present,
    content => template('bacula/device.conf.erb'),
  }
}
