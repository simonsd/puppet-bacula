class bacula::storage (
  $sd_label                   = $::bacula::params::sd_label,
  $sd_port                    = $::bacula::params::sd_port,
  $config_root                = $::bacula::params::config_root,
  $working_dir                = $::bacula::params::working_dir,
  $pid_dir                    = $::bacula::params::pid_dir,
  $max_concurrent_jobs        = $::bacula::params::sd_max_concurrent_jobs,
  $director_label             = $::bacula::params::director_label,
  $director_password          = $::bacula::params::director_password,
  $bconsole_pkgname           = $::bacula::params::bconsole_pkgname,
  $log_dir                    = $::bacula::params::log_dir,
  $storage_dir                = $::bacula::params::storage_dir,
  $device_collect_filter      = $::bacula::params::device_collect_filter,
  $storage_service_name       = $::bacula::params::storage_service_name,
  $storage_service_ensure     = $::bacula::params::storage_service_ensure,
  $storage_service_enable     = $::bacula::params::storage_service_enable,
  $storage_service_hasstatus  = $::bacula::params::storage_service_hasstatus,
) inherits ::bacula::params {

  include ::bacula::common

  include ::bacula::storage::install
  include ::bacula::storage::config
  include ::bacula::storage::service

  include ::bacula::default::devices

}
