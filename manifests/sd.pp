class bacula::sd (
  $label                      = $::bacula::params::sd_label,
  $port                       = $::bacula::params::sd_port,
  $pkg_name                   = $::bacula::params::sd_pkg_name,
  $pkg_version                = $::bacula::params::sd_pkg_version,
  $user                       = $::bacula::params::default_user,
  $group                      = $::bacula::params::default_group,
  $config_root                = $::bacula::params::config_root,
  $working_dir                = $::bacula::params::working_dir,
  $pid_dir                    = $::bacula::params::pid_dir,
  $max_concurrent_jobs        = $::bacula::params::sd_max_concurrent_jobs,
  $messages                   = $::bacula::params::sd_messages,
  $director_server            = $::bacula::params::director_server,
  $director_port              = $::bacula::params::director_port,
  $director_password          = $::bacula::params::director_password,
  $bconsole_pkgname           = $::bacula::params::bconsole_pkgname,
  $log_dir                    = $::bacula::params::log_dir,
  $storage_dir                = $::bacula::params::storage_dir,
  $service_name               = $::bacula::params::sd_service_name,
  $service_ensure             = $::bacula::params::sd_service_ensure,
  $service_enable             = $::bacula::params::sd_service_enable,
  $service_hasstatus          = $::bacula::params::sd_service_hasstatus,
  $messages_mailcommand       = $::bacula::params::messages_mailcommand,
  $messages_operatorcommand   = $::bacula::params::messages_operatorcommand,
) inherits ::bacula::params {

  class{'::bacula::common':
    director_server   => $director_server,
    director_port     => $director_port,
    director_password => $director_password,
    user              => $user,
    group             => $group,
    config_root       => $config_root,
    working_dir       => $config_dir,
    pid_dir           => $pid_dir,
    log_dir           => $log_dir,
  }

  class{'::bacula::sd::install':
    pkg_name    => $pkg_name,
    pkg_version => $pkg_version,
  }

  class{'::bacula::sd::config':
    config_root         => $config_root,
    service_name        => $service_name,
    storage_dir         => $storage_dir,
    label               => $label,
    port                => $port,
    working_dir         => $working_dir,
    pid_dir             => $pid_dir,
    max_concurrent_jobs => $max_concurrent_jobs,
    messages            => $messages,
    director_server     => $director_server,
    director_password   => $director_password,
  }

  class{'::bacula::sd::service':
    service_name => $service_name,
    ensure       => $service_ensure,
    enable       => $service_enable,
    hasstatus    => $service_hasstatus,
  }

  Class[::bacula::sd::install] -> Class[::bacula::sd::config] -> Class[::bacula::sd::service]

}
