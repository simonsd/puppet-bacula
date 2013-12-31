class bacula::sd::config (
  $config_root         = $::bacula::params::config_root,
  $service_name        = $::bacula::params::sd_service_name,
  $storage_dir         = $::bacula::params::storage_dir,
  $label               = $::bacula::params::sd_label,
  $port                = $::bacula::params::sd_port,
  $working_dir         = $::bacula::params::working_dir,
  $pid_dir             = $::bacula::params::pid_dir,
  $max_concurrent_jobs = $::bacula::params::sd_max_concurrent_jobs,
  $messages            = $::bacula::params::sd_messages,
  $director_server     = $::bacula::params::director_server,
  $director_password   = $::bacula::params::director_password,
) inherits ::bacula::params {

  file{"${config_root}/bacula-sd.conf":
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('bacula/bacula-sd.conf.erb'),
    notify  => Service[$service_name],
  }

  ::bacula::messages{'bacula-sd':}

  file{$storage_dir:
    ensure  => directory,
    mode    => '0700',
  }

  file{"${config_root}/devices.d":
    ensure => directory,
  }

  Bacula::Device   <<| |>> { notify => Service[$service_name] }
  Bacula::Messages <<| |>> { notify => Service[$service_name] }

}
