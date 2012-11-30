class bacula::storage (
  $sd_label            = $::bacula::params::sd_label,
  $sd_port             = $::bacula::params::sd_port,
  $config_dir          = $::bacula::params::config_dir,
  $working_dir         = $::bacula::params::working_dir,
  $pid_dir             = $::bacula::params::pid_dir,
  $max_concurrent_jobs = $::bacula::params::sd_max_concurrent_jobs,
  $director_label      = $::bacula::params::director_label,
  $director_password   = $::bacula::params::director_password,
  $bconsole_pkgname    = $::bacula::params::bconsole_pkgname,
  $log_dir             = $::bacula::params::log_dir,
) inherits ::bacula::params {

  include ::bacula::common

  include ::bacula::storage::install
  include ::bacula::storage::config
  include ::bacula::storage::service

  include ::bacula::default::devices

}
