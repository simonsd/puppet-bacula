define bacula::device (
  $path        = "${::bacula::params::storage_dir}/${::fqdn}",
  $owner       = $::bacula::params::device_owner,
  $group       = $::bacula::params::device_group,
  $config_root = $::bacula::params::config_root,
){

  require ::bacula::params

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
