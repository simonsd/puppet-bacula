define bacula::device (
  $path  = undef,
  $owner = $::bacula::default_device_owner,
  $group = $::bacula::default_device_group,
){

  file{$path:
    ensure => directory,
    owner  => $owner,
    group  => $group,
  }

  file{"/etc/bacula/devices.d/${name}.conf":
    ensure  => present,
    content => template('bacula/device.conf.erb'),
  }

}
