class bacula::fd (
  $client                    = $::fqdn,
  $port                      = $::bacula::params::fd_port,
  $working_dir               = $::bacula::params::working_dir,
  $pid_dir                   = $::bacula::params::pid_dir,
  $max_concurrent_jobs       = $::bacula::params::fd_max_concurrent_jobs,
  $allowed_director_label    = $::bacula::params::director_label,
  $allowed_director_password = $::bacula::params::director_password,
  $log_output                = $::bacula::params::default_log_output,
  $pkgname                   = $::bacula::params::fd_pkgname,
  $user                      = $::bacula::params::default_user,
  $group                     = $::bacula::params::default_group,
) {

  include ::bacula::console
  include ::bacula::fd::install
  include ::bacula::fd::config
  include ::bacula::fd::service

}
