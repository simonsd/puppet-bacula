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
  $dbname                     = $::bacula::params::dbname,
  $dbhost                     = $::bacula::params::dbhost,
  $dbuser                     = $::bacula::params::dbuser,
  $dbpassword                 = $::bacula::params::dbpassword,
  $db_init_command            = $::bacula::params::db_init_command,
  $log_email                  = $::bacula::params::log_email,
  $catalog_collect_filter     = $::bacula::params::catalog_collect_filter,
  $client_collect_filter      = $::bacula::params::client_collect_filter,
  $fileset_collect_filter     = $::bacula::params::fileset_collect_filter,
  $job_collect_filter         = $::bacula::params::job_collect_filter,
  $jobdef_collect_filter      = $::bacula::params::jobdef_collect_filter,
  $pool_collect_filter        = $::bacula::params::pool_collect_filter,
  $schedule_collect_filter    = $::bacula::params::schedule_collect_filter,
  $storage_collect_filter     = $::bacula::params::storage_collect_filter,
  $max_concurrent_jobs        = $::bacula::params::dir_max_concurrent_jobs,
) inherits ::bacula::params {

  include ::bacula::common

  include ::bacula::director::install
  include ::bacula::director::config
  include ::bacula::director::service

  include ::bacula::default::filesets
  include ::bacula::default::jobs
  include ::bacula::default::jobdefs
  include ::bacula::default::pools
  include ::bacula::default::schedules

  Class['::bacula::director::install'] ->
  Class['::bacula::director::config'] ->
  Class['::bacula::director::service']

}
