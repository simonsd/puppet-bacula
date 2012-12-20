define bacula::client (
  $storage_server   = $::bacula::default_storage_server,
  $storage_path     = $::bacula::default_storage_path,
  $storage_password = $::bacula::default_storage_password,
  $device_owner     = $::bacula::default_device_owner,
  $device_group     = $::bacula::default_device_group,
) {

  concat{"${::bacula::config_root}/clients.d/${title}.conf":
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  concat::fragment{"${::bacula::config_root}/clients.d/${title}.conf-client":
    target  => "${::bacula::config_root}/clients.d/${title}.conf",
    content => template('bacula/client.erb'),
    order   => 01,
  }

  @@bacula::device{$title:
    path  => "${storage_path}/${title}",
    owner => $device_owner,
    group => $device_group,
  }

}
