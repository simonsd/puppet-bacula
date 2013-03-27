class bacula::director::config inherits ::bacula::director {

  File{
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  file{"${config_root}/bacula-dir.conf":
    ensure  => 'file',
    content => template('bacula/bacula-dir.conf.erb'),
    notify  => Service[$director_service_name],
  }

  ::bacula::messages{'bacula-dir':
    mail        => [ [$log_email, 'all, !skipped'], ],
    mailcommand => "/usr/sbin/bsmtp -h localhost -f \\\"\(Bacula\) ${from_email}\\\" -s \\\"Bacula: %t %e of %c %l\\\" %r",
  }

  file{"${config_root}/catalog.d":}
  file{"${config_root}/clients.d":}
  file{"${config_root}/filesets.d":}
  file{"${config_root}/jobdefs.d":}
  file{"${config_root}/pools.d":}
  file{"${config_root}/schedules.d":}
  file{"${config_root}/storage.d":}

  Bacula::Catalog  <<| |>> { notify => Service[$director_service_name] }
  Bacula::Client   <<| |>> { notify => Service[$director_service_name] }
  Bacula::Fileset  <<| |>> { notify => Service[$director_service_name] }
  Bacula::Job      <<| |>> { notify => Service[$director_service_name] }
  Bacula::Jobdefs  <<| |>> { notify => Service[$director_service_name] }
  Bacula::Messages <<| |>> { notify => Service[$director_service_name] }
  Bacula::Pool     <<| |>> { notify => Service[$director_service_name] }
  Bacula::Schedule <<| |>> { notify => Service[$director_service_name] }
  Bacula::Storage  <<| |>> { notify => Service[$director_service_name] }

}
