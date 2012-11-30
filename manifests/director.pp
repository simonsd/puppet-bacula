class bacula::director (
  $bconsole_pkgname = $::bacula::params::bconsole_pkgname,
) inherits ::bacula::params {

  include concat::setup
  include ::bacula::console

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
