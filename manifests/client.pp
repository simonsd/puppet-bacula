define bacula::client (
  $address          = '',
  $storage_server   = $::bacula::params::default_storage_server,
  $storage_dir      = $::bacula::params::storage_dir,
  $storage_port     = $::bacula::params::storage_port,
  $storage_password = $::bacula::params::default_storage_password,
  $device_owner     = $::bacula::params::default_device_owner,
  $device_group     = $::bacula::params::default_device_group,
  $fd_port          = $::bacula::params::fd_port,
  $fd_password      = $::bacula::params::fd_password,
  $config_root      = $::bacula::params::config_root,
  $catalog          = $::bacula::params::catalog,
) {

  require ::bacula::params

  case $address {
    '':      { $_address = $title }
    default: { $_address = $address }
  }

  concat{"${config_root}/clients.d/${title}.conf":
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  concat::fragment{"${config_root}/clients.d/${title}.conf-client":
    target  => "${config_root}/clients.d/${title}.conf",
    content => template('bacula/client.conf.erb'),
    order   => 01,
  }

  @@bacula::storage{$title:
    config_root => $config_root,
    sd_server   => $storage_server,
    sd_port     => $storage_port,
    sd_password => $storage_password,
  }

  @@bacula::device{$title:
    config_root => $config_root,
    path        => "${storage_dir}/${title}",
    owner       => $device_owner,
    group       => $device_group,
  }

}
