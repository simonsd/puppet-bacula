class bacula::fd (
  $client                    = $::fqdn,
  $port                      = $::bacula::params::fd_port,
  $working_dir               = $::bacula::params::working_dir,
  $pid_dir                   = $::bacula::params::pid_dir,
  $max_concurrent_jobs       = $::bacula::params::fd_max_concurrent_jobs,
  $allowed_director_label    = $::bacula::params::director_label,
  $allowed_director_password = $::bacula::params::director_password,
  $pkgname                   = $::bacula::params::fd_pkgname,
  $user                      = $::bacula::params::default_user,
  $group                     = $::bacula::params::default_group,
  $bconsole_pkgname          = $::bacula::params::bconsole_pkgname,
  $log_dir                   = $::bacula::params::log_dir,
) inherits ::bacula::params {

  include ::bacula::common

  include ::bacula::fd::install
  include ::bacula::fd::config
  include ::bacula::fd::service

}
