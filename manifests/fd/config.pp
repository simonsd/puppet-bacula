class bacula::fd::config (
  $config_root      = $::bacula::params::config_root,
  $pkg_name         = $::bacula::params::fd_pkg_name,
  $service_name     = $::bacula::params::fd_service_name,
  $client           = $::fqdn,
  $address          = undef,
  $storage_server   = $::bacula::params::default_storage_server,
  $storage_dir      = $::bacula::params::storage_dir,
  $storage_port     = $::bacula::params::storage_port,
  $storage_password = $::bacula::params::default_storage_password,
  $device_owner     = $::bacula::params::device_owner,
  $device_group     = $::bacula::params::device_group,
  $port             = $::bacula::params::fd_port,
  $password         = $::bacula::params::fd_password,
  $catalog          = $::bacula::params::default_catalog,
) inherits ::bacula::params {

  File{
    ensure => 'file',
    owner  => $user,
    group  => $group,
  }

  file{"${config_root}/bacula-fd.conf":
    mode    => '0640',
    content => template('bacula/bacula-fd.conf.erb'),
    require => Package[$pkg_name],
    notify  => Service[$service_name],
  }

  file{'/usr/sbin/bacula-fd':
    mode  => '0755',
  }

  ::bacula::messages{'bacula-fd':}

  # Export client resource for director
  @@bacula::client{$client:
    address          => $address,
    storage_server   => $storage_server,
    storage_dir      => $storage_dir,
    storage_port     => $storage_port,
    storage_password => $storage_password,
    device_owner     => $device_owner,
    device_group     => $device_group,
    fd_port          => $port,
    fd_password      => $password,
    config_root      => $config_root,
    catalog          => $catalog,
  }

  Bacula::Messages <<| |>> { notify => Service[$service_name] }

}
