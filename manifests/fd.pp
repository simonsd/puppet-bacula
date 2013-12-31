class bacula::fd (
  $client                    = $::fqdn,
  $port                      = $::bacula::params::fd_port,
  $password                  = $::bacula::params::fd_password,
  $config_root               = $::bacula::params::config_root,
  $working_dir               = $::bacula::params::working_dir,
  $pid_dir                   = $::bacula::params::pid_dir,
  $max_concurrent_jobs       = $::bacula::params::fd_max_concurrent_jobs,
  $messages                  = $::bacula::params::fd_messages,
  $director_server           = $::bacula::params::director_server,
  $pkg_name                  = $::bacula::params::fd_pkg_name,
  $pkg_version               = $::bacula::params::fd_pkg_version,
  $user                      = $::bacula::params::default_user,
  $group                     = $::bacula::params::default_group,
  $bconsole_pkgname          = $::bacula::params::bconsole_pkgname,
  $log_dir                   = $::bacula::params::log_dir,
  $servive_name              = $::bacula::params::fd_service_name,
  $servive_ensure            = $::bacula::params::fd_service_ensure,
  $servive_enable            = $::bacula::params::fd_service_enable,
  $servive_hasstatus         = $::bacula::params::fd_service_hasstatus,
  $catalog                   = $::bacula::params::default_catalog,
  $address                   = undef,
  $storage_server            = $::bacula::params::default_storage_server,
  $storage_dir               = $::bacula::params::storage_dir,
  $storage_port              = $::bacula::params::storage_port,
  $storage_password          = $::bacula::params::default_storage_password,
  $device_owner              = $::bacula::params::device_owner,
  $device_group              = $::bacula::params::device_group,
  $messages_mailcommand      = $::bacula::params::messages_mailcommand,
  $messages_operatorcommand  = $::bacula::params::messages_operatorcommand,
  $director_server           = $::bacula::params::director_server,
  $director_port             = $::bacula::params::director_port,
  $director_password         = $::bacula::params::director_password,
) inherits ::bacula::params {

  class{'::bacula::common':
    director_server   => $director_server,
    director_port     => $director_port,
    director_password => $director_password,
    user              => $user,
    group             => $group,
    config_root       => $config_root,
    working_dir       => $working_dir,
    pid_dir           => $pid_dir,
    log_dir           => $log_dir,
  }

  class{'::bacula::fd::install':
    pkg_name    => $pkg_name,
    pkg_version => $pkg_version,
  }

  class{'::bacula::fd::config':
    config_root         => $config_root,
    pkg_name            => $pkg_name,
    service_name        => $service_name,
    client              => $client,
    address             => $address,
    storage_server      => $storage_server,
    storage_dir         => $storage_dir,
    storage_port        => $storage_port,
    storage_password    => $storage_password,
    device_owner        => $device_owner,
    device_group        => $device_group,
    port                => $port,
    password            => $password,
    catalog             => $catalog,
    working_dir         => $working_dir,
    pid_dir             => $pid_dir,
    max_concurrent_jobs => $max_concurrent_jobs,
    director_server     => $director_server,
  }

  class{'::bacula::fd::service':
    name      => $service_name,
    ensure    => $service_ensure,
    enable    => $service_enable,
    hasstatus => $service_hasstatus,
  }

  Class['::bacula::fd::install'] ->
  Class['::bacula::fd::config'] ->
  Class['::bacula::fd::service']

}
