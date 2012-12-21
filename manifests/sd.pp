class bacula::sd (
  $sd_label                   = $::bacula::params::sd_label,
  $sd_port                    = $::bacula::params::sd_port,
  $config_root                = $::bacula::params::config_root,
  $working_dir                = $::bacula::params::working_dir,
  $pid_dir                    = $::bacula::params::pid_dir,
  $max_concurrent_jobs        = $::bacula::params::sd_max_concurrent_jobs,
  $director_server            = $::bacula::params::director_server,
  $director_password          = $::bacula::params::director_password,
  $bconsole_pkgname           = $::bacula::params::bconsole_pkgname,
  $log_dir                    = $::bacula::params::log_dir,
  $storage_dir                = $::bacula::params::storage_dir,
  $device_collect_filter      = $::bacula::params::device_collect_filter,
  $sd_service_name            = $::bacula::params::sd_service_name,
  $sd_service_ensure          = $::bacula::params::sd_service_ensure,
  $sd_service_enable          = $::bacula::params::sd_service_enable,
  $sd_service_hasstatus       = $::bacula::params::sd_service_hasstatus,
) inherits ::bacula::params {

  include ::bacula::common

  include ::bacula::sd::install
  include ::bacula::sd::config
  include ::bacula::sd::service

  include ::bacula::default::devices

  Class[::bacula::sd::install] -> Class[::bacula::sd::config] -> Class[::bacula::sd::service]

}
