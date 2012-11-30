class bacula::director {

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
