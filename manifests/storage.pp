class bacula::storage {

  include ::concat::setup
  include ::bacula::storage::install
  include ::bacula::storage::config
  include ::bacula::storage::service

}
