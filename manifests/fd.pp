class bacula::fd (
  $client                    = $::fqdn,
  $fd_port                   = $::bacula::params::fd_port,
  $fd_password               = $::bacula::params::fd_password,
  $config_root               = $::bacula::params::config_root,
  $working_dir               = $::bacula::params::working_dir,
  $pid_dir                   = $::bacula::params::pid_dir,
  $max_concurrent_jobs       = $::bacula::params::fd_max_concurrent_jobs,
  $messages                  = $::bacula::params::fd_messages,
  $director_server           = $::bacula::params::director_server,
  $fd_pkgname                = $::bacula::params::fd_pkgname,
  $user                      = $::bacula::params::default_user,
  $group                     = $::bacula::params::default_group,
  $bconsole_pkgname          = $::bacula::params::bconsole_pkgname,
  $log_dir                   = $::bacula::params::log_dir,
  $fd_servive_name           = $::bacula::params::fd_service_name,
  $fd_servive_ensure         = $::bacula::params::fd_service_ensure,
  $fd_servive_enable         = $::bacula::params::fd_service_enable,
  $fd_servive_hasstatus      = $::bacula::params::fd_service_hasstatus,
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
) inherits ::bacula::params {

  include ::bacula::common

  include ::bacula::fd::install
  include ::bacula::fd::config
  include ::bacula::fd::service

  Class['::bacula::fd::install'] ->
  Class['::bacula::fd::config'] ->
  Class['::bacula::fd::service']

}
