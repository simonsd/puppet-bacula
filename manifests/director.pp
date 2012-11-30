class bacula::director (
  $bconsole_pkgname = $::bacula::params::bconsole_pkgname,
  $log_dir          = $::bacula::params::log_dir,
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
