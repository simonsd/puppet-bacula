define bacula::device (
  $path        = "${::bacula::params::default_storage_path}/${::fqdn}",
  $owner       = $::bacula::params::default_device_owner,
  $group       = $::bacula::params::default_device_group,
  $config_root = $::bacula::params::config_root,
){

  file{$path:
    ensure => directory,
    owner  => $owner,
    group  => $group,
  }

  file{"${config_root}/devices.d/${title}.conf":
    ensure  => 'file',
    content => template('bacula/device.conf.erb'),
  }

}
