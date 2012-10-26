class bacula (
  $admin_email              = $::bacula::params::admin_email,
  $operator_email           = $::bacula::params::operator_email,
  $director_server          = $::bacula::params::director_server,
  $director_label           = $::bacula::params::director_label,
  $director_password        = $::bacula::params::director_password,
  $default_storage_server   = $::bacula::params::director_password,
  $default_storage_label    = $::bacula::params::default_storage_label,
  $default_storage_password = $::bacula::params::default_storage_password,
  $default_storage_path     = $::bacula::params::default_storage_path,
  $default_storage_owner    = $::bacula::params::default_storage_owner,
  $default_storage_group    = $::bacula::params::default_storage_group,
  $storage_dir              = $::bacula::params::storage_dir,
  $working_dir              = $::bacula::params::working_dir,
  $dbname                   = $::bacula::params::dbname,
  $dbuser                   = $::bacula::params::dbuser,
  $dbpassword               = $::bacula::params::dbpassword,
  $dbhost                   = $::bacula::params::dbhost,
  $director                 = $::bacula::params::director,
  $storage                  = $::bacula::params::storage,
  $client                   = $::bacula::params::client,
  $schedules                = $::bacula::params::schedules,
  $filesets                 = $::bacula::params::filesets,
  $jobdefs                  = $::bacula::params::jobdefs,
  $config_root              = $::bacula::params::config_root,
) {

  if $director {
    include ::bacula::director
    include ::bacula::default::filesets
    include ::bacula::default::schedules
    include ::bacula::default::jobdefs
    include ::bacula::default::jobs
    include ::bacula::default::pools
  }

  if $storage {
    include ::bacula::storage
    include ::bacula::default::devices
  }

  if $client {
    include ::bacula::fd
  }

  include ::bacula::console

}
