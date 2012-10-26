define bacula::device (
  $path  = "${::bacula::default_storage_path}/${::fqdn}",
  $owner = $::bacula::default_device_owner,
  $group = $::bacula::default_device_group,
){

  file{$path:
    ensure => directory,
    owner  => $owner,
    group  => $group,
  }

  file{"${::bacula::config_root}/devices.d/${title}.conf":
    ensure  => present,
    content => template('bacula/device.conf.erb'),
  }

}
