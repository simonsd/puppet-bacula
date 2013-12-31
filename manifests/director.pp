class bacula::director (
  $pkg_name                   = $::bacula::params::director_pkg_name,
  $pkg_version                = $::bacula::params::director_pkg_version,
  $service_name               = $::bacula::params::director_service_name,
  $service_ensure             = $::bacula::params::director_service_ensure,
  $service_enable             = $::bacula::params::director_service_enable,
  $service_hasstatus          = $::bacula::params::director_service_hasstatus,
  $server                     = $::bacula::params::director_server,
  $port                       = $::bacula::params::director_port,
  $password                   = $::bacula::params::director_password,
  $bconsole_pkgname           = $::bacula::params::bconsole_pkgname,
  $user                       = $::bacula::params::default_user,
  $group                      = $::bacula::params::default_group,
  $config_root                = $::bacula::params::config_root,
  $working_dir                = $::bacula::params::working_dir,
  $log_dir                    = $::bacula::params::log_dir,
  $pid_dir                    = $::bacula::params::pid_dir,
  $from_email                 = $::bacula::params::from_email,
  $log_email                  = $::bacula::params::log_email,
  $max_concurrent_jobs        = $::bacula::params::dir_max_concurrent_jobs,
  $messages                   = $::bacula::params::dir_messages,
  $filesets                   = $::bacula::params::filesets,
  $jobdefs                    = $::bacula::params::jobdefs,
  $schedules                  = $::bacula::params::schedules,
  $messages_mailcommand       = $::bacula::params::messages_mailcommand,
  $messages_operatorcommand   = $::bacula::params::messages_operatorcommand,
) inherits ::bacula::params {

  class{'::bacula::common':
    director_server   => $server,
    director_port     => $port,
    director_password => $password,
    user              => $user,
    group             => $group,
    config_root       => $config_root,
    working_dir       => $config_dir,
    pid_dir           => $pid_dir,
    log_dir           => $log_dir,
  }

  class{'::bacula::director::install':
    pkg_name    => $pkg_name,
    pkg_version => $pkg_version,
  }

  class{'::bacula::director::config':
    config_root  => $config_root,
    service_name => $service_name,
    log_email    => $log_email,
    from_email   => $from_email,
  }

  class{'::bacula::director::service':
    name      => $service_name,
    ensure    => $service_ensure,
    enable    => $service_enable,
    hasstatus => $service_hasstatus,
  }

  Class['::bacula::director::install'] ->
  Class['::bacula::director::config'] ->
  Class['::bacula::director::service']

  include ::bacula::default::filesets
  include ::bacula::default::jobdefs
  include ::bacula::default::pools
  include ::bacula::default::schedules

}
