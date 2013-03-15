class bacula (
  $from_email               = $::bacula::params::from_email,
  $log_email                = $::bacula::params::log_email,

  $director_server          = $::bacula::params::director_server,
  $director_password        = $::bacula::params::director_password,

  $sd_server                = $::bacula::params::sd_server,
  $sd_label                 = $::bacula::params::sd_label,
  $sd_password              = $::bacula::params::sd_password,
  $sd_owner                 = $::bacula::params::sd_owner,
  $sd_group                 = $::bacula::params::sd_group,

  $bconsole_pkgname         = $::bacula::params::bconsole_pkgname,

  $default_user             = $::bacula::params::default_user,
  $default_group            = $::bacula::params::default_group,
  $storage_dir              = $::bacula::params::storage_dir,
  $working_dir              = $::bacula::params::working_dir,
  $config_root              = $::bacula::params::config_root,
  $log_dir                  = $::bacula::params::log_dir,

  $dbname                   = $::bacula::params::dbname,
  $dbuser                   = $::bacula::params::dbuser,
  $dbpassword               = $::bacula::params::dbpassword,
  $dbhost                   = $::bacula::params::dbhost,

  $schedules                = $::bacula::params::schedules,
  $filesets                 = $::bacula::params::filesets,
  $jobdefs                  = $::bacula::params::jobdefs,

) inherits ::bacula::params {

}
