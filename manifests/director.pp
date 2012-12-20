class bacula::director (
  $director_pkgname           = $::bacula::params::director_pkgname,
  $director_service_name      = $::bacula::params::director_service,
  $director_service_ensure    = $::bacula::params::director_service,
  $director_service_enable    = $::bacula::params::director_service,
  $director_service_hasstatus = $::bacula::params::director_service,
  $director_label             = $::bacula::params::director_label,
  $director_port              = $::bacula::params::director_port,
  $director_password          = $::bacula::params::director_password,
  $bconsole_pkgname           = $::bacula::params::bconsole_pkgname,
  $working_dir                = $::bacula::params::working_dir,
  $log_dir                    = $::bacula::params::log_dir,
  $dbname                     = $::bacula::params::dbname,
  $dbhost                     = $::bacula::params::dbhost,
  $dbuser                     = $::bacula::params::dbuser,
  $dbpassword                 = $::bacula::params::dbpassword,
  $admin_email                = $::bacula::params::admin_email,
) inherits ::bacula::params {

  include ::bacula::common

  include ::bacula::director::install
  include ::bacula::director::config
  include ::bacula::director::service
  include ::bacula::director::collect

  include ::bacula::default::filesets
  include ::bacula::default::schedules
  include ::bacula::default::jobs
  include ::bacula::default::jobdefs
  include ::bacula::default::pools

}
