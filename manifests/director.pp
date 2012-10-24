class bacula::director {

  include concat::setup
  include ::bacula::director::install
  include ::bacula::director::config
  include ::bacula::director::service
  include ::bacula::director::collect

}
