class bacula::director (
  $director_pkgname           = $::bacula::params::director_pkgname,
  $director_service_name      = $::bacula::params::director_service_name,
  $director_service_ensure    = $::bacula::params::director_service_ensure,
  $director_service_enable    = $::bacula::params::director_service_enable,
  $director_service_hasstatus = $::bacula::params::director_service_hasstatus,
  $director_server            = $::bacula::params::director_server,
  $director_port              = $::bacula::params::director_port,
  $director_password          = $::bacula::params::director_password,
  $bconsole_pkgname           = $::bacula::params::bconsole_pkgname,
  $config_root                = $::bacula::params::config_root,
  $working_dir                = $::bacula::params::working_dir,
  $log_dir                    = $::bacula::params::log_dir,
  $pid_dir                    = $::bacula::params::pid_dir,
  $from_email                 = $::bacula::params::from_email,
  $log_email                  = $::bacula::params::log_email,
  $max_concurrent_jobs        = $::bacula::params::dir_max_concurrent_jobs,
  $filesets                   = $::bacula::params::filesets,
  $jobdefs                    = $::bacula::params::jobdefs,
  $schedules                  = $::bacula::params::schedules,
  $messages_mailcommand       = $::bacula::params::messages_mailcommand,
  $messages_operatorcommand   = $::bacula::params::messages_operatorcommand,
) inherits ::bacula::params {

  include ::bacula::common

  include ::bacula::director::install
  include ::bacula::director::config
  include ::bacula::director::service

  include ::bacula::default::filesets
  include ::bacula::default::jobdefs
  include ::bacula::default::pools
  include ::bacula::default::schedules

  Class['::bacula::director::install'] ->
  Class['::bacula::director::config'] ->
  Class['::bacula::director::service']

}
