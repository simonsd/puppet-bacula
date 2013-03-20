class bacula (
  $director                   = undef,
  $sd                         = undef,
  $fd                         = true,
  $config_root                = $::bacula::params::config_root,
  $working_dir                = $::bacula::params::working_dir,
  $pid_dir                    = $::bacula::params::pid_dir,
  $log_dir                    = $::bacula::params::log_dir,
  $dbuser                     = $::bacula::params::dbuser,
  $dbpassword                 = $::bacula::params::dbpassword,
  $dbhost                     = $::bacula::params::dbhost,
  $from_email                 = $::bacula::params::from_email,
  $log_email                  = $::bacula::params::log_email,
  $director_server            = $::bacula::params::director_server,
  $director_password          = $::bacula::params::director_password,
  $director_port              = $::bacula::params::director_port,
  $director_pkgname           = $::bacula::params::director_pkgname,
  $director_service_name      = $::bacula::params::director_service_name,
  $director_service_hasstatus = $::bacula::params::director_service_hasstatus,
  $director_service_ensure    = $::bacula::params::director_service_ensure,
  $director_service_enable    = $::bacula::params::director_service_enable,
  $db_init_command            = $::bacula::params::db_init_command,
  $dir_max_concurrent_jobs    = $::bacula::params::dir_max_concurrent_jobs,
  $schedules                  = $::bacula::params::schedules,
  $filesets                   = $::bacula::params::filesets,
  $jobdefs                    = $::bacula::params::jobdefs,
  $sd_port                    = $::bacula::params::sd_port,
  $storage_dir                = $::bacula::params::storage_dir,
  $sd_pkgname                 = $::bacula::params::sd_pkgname,
  $sd_service_name            = $::bacula::params::sd_service_name,
  $sd_service_ensure          = $::bacula::params::sd_service_ensure,
  $sd_service_enable          = $::bacula::params::sd_service_enable,
  $sd_service_hasstatus       = $::bacula::params::sd_service_hasstatus,
  $sd_server                  = $::bacula::params::sd_server,
  $sd_label                   = $::bacula::params::sd_label,
  $sd_password                = $::bacula::params::sd_password,
  $sd_owner                   = $::bacula::params::sd_owner,
  $sd_group                   = $::bacula::params::sd_group,
  $sd_max_concurrent_jobs     = $::bacula::params::sd_max_concurrent_jobs,
  $media_type                 = $::bacula::params::media_type,
  $fd_port                    = $::bacula::params::fd_port,
  $fd_password                = $::bacula::params::fd_password,
  $fd_max_concurrent_jobs     = $::bacula::params::fd_max_concurrent_jobs,
  $fd_pkgname                 = $::bacula::params::fd_pkgname,
  $fd_service_name            = $::bacula::params::fd_service_name,
  $fd_service_ensure          = $::bacula::params::fd_service_ensure,
  $fd_service_enable          = $::bacula::params::fd_service_enable,
  $fd_service_hasstatus       = $::bacula::params::fd_service_hasstatus,
  $bconsole_pkgname           = $::bacula::params::bconsole_pkgname,
  $catalog                    = $::bacula::params::catalog,
  $default_pool               = $::bacula::params::default_pool,
  $default_jobtype            = $::bacula::params::default_jobtype,
  $default_jobdefs            = $::bacula::params::default_jobdefs,
  $default_storage            = $::bacula::params::default_storage,
  $default_fullpool           = $::bacula::params::default_fullpool,
  $default_incrementalpool    = $::bacula::params::default_incrementalpool,
  $default_fileset            = $::bacula::params::default_fileset,
  $default_schedule           = $::bacula::params::default_schedule,
) inherits ::bacula::params {

  if $director {
    class{'bacula::director':
      $director_pkgname           = $director_pkgname,
      $director_service_name      = $director_service_name,
      $director_service_ensure    = $director_service_ensure,
      $director_service_enable    = $director_service_enable,
      $director_service_hasstatus = $director_service_hasstatus,
      $director_server            = $director_server,
      $director_port              = $director_port,
      $director_password          = $director_password,
      $bconsole_pkgname           = $bconsole_pkgname,
      $config_root                = $config_root,
      $working_dir                = $working_dir,
      $log_dir                    = $log_dir,
      $pid_dir                    = $pid_dir,
      $from_email                 = $from_email,
      $log_email                  = $log_email,
      $max_concurrent_jobs        = $dir_max_concurrent_jobs,
      $filesets                   = $filesets,
      $jobdefs                    = $jobdefs,
      $schedules                  = $schedules,
    }
  }

  if $sd {
    class{'bacula::sd':
      $sd_label             = $sd_label,
      $sd_port              = $sd_port,
      $config_root          = $config_root,
      $working_dir          = $working_dir,
      $pid_dir              = $pid_dir,
      $max_concurrent_jobs  = $sd_max_concurrent_jobs,
      $director_server      = $director_server,
      $director_password    = $director_password,
      $bconsole_pkgname     = $bconsole_pkgname,
      $log_dir              = $log_dir,
      $storage_dir          = $storage_dir,
      $sd_service_name      = $sd_service_name,
      $sd_service_ensure    = $sd_service_ensure,
      $sd_service_enable    = $sd_service_enable,
      $sd_service_hasstatus = $sd_service_hasstatus,
    }
  }

  if $fd {
    class{'bacula::fd':
      $client                    = $::fqdn,
      $fd_port                   = $fd_port,
      $fd_password               = $fd_password,
      $config_root               = $config_root,
      $working_dir               = $working_dir,
      $pid_dir                   = $pid_dir,
      $max_concurrent_jobs       = $fd_max_concurrent_jobs,
      $director_server           = $director_server,
      $fd_pkgname                = $fd_pkgname,
      $user                      = $default_user,
      $group                     = $default_group,
      $bconsole_pkgname          = $bconsole_pkgname,
      $log_dir                   = $log_dir,
      $fd_servive_name           = $fd_service_name,
      $fd_servive_ensure         = $fd_service_ensure,
      $fd_servive_enable         = $fd_service_enable,
      $fd_servive_hasstatus      = $fd_service_hasstatus,
      $catalog                   = $default_catalog,
      $sd_server                 = $sd_server,
      $sd_port                   = $sd_port,
      $sd_password               = $sd_password,
      $storage_server            = $default_storage_server,
      $storage_path              = $default_storage_path,
      $storage_password          = $default_storage_password,
      $device_owner              = $default_device_owner,
      $device_group              = $default_device_group,
    }
  }

}
