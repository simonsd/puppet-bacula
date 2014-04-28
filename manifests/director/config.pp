class bacula::director::config (
  $config_root         = $::bacula::params::config_root,
  $service_name        = $::bacula::params::director_service_name,
  $log_email           = $::bacula::params::log_email,
  $from_email          = $::bacula::params::from_email,
  $server              = $::bacula::params::director_server,
  $port                = $::bacula::params::director_port,
  $working_dir         = $::bacula::params::working_dir,
  $pid_dir             = $::bacula::params::pid_dir,
  $max_concurrent_jobs = $::bacula::params::dir_max_concurrent_jobs,
  $password            = $::bacula::params::director_password,
  $messages            = $::bacula::params::dir_messages,
) inherits ::bacula::params {

  File{
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
    recurse => true,
    purge   => true,
  }

  file{"${config_root}/bacula-dir.conf":
    ensure  => 'file',
    content => template('bacula/bacula-dir.conf.erb'),
    notify  => Service[$service_name],
  }

  ::bacula::messages{'bacula-dir':}

  file{"${config_root}/catalog.d":}
  file{"${config_root}/clients.d":}
  file{"${config_root}/filesets.d":}
  file{"${config_root}/jobdefs.d":}
  file{"${config_root}/pools.d":}
  file{"${config_root}/schedules.d":}
  file{"${config_root}/storage.d":}

  Bacula::Catalog  <<| |>> { notify => Service[$service_name] }
  Bacula::Client   <<| |>> { notify => Service[$service_name] }
  Bacula::Fileset  <<| |>> { notify => Service[$service_name] }
  Bacula::Job      <<| |>> { notify => Service[$service_name] }
  Bacula::Jobdefs  <<| |>> { notify => Service[$service_name] }
  Bacula::Messages <<| |>> { notify => Service[$service_name] }
  Bacula::Pool     <<| |>> { notify => Service[$service_name] }
  Bacula::Schedule <<| |>> { notify => Service[$service_name] }
  Bacula::Storage  <<| |>> { notify => Service[$service_name] }

}
