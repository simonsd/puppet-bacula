class bacula::director::config {

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

  file{"${log_dir}/bacula-dir.log":
    ensure => 'file',
    mode   => '0644',
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
  Bacula::Pool     <<| |>> { notify => Service[$director_service_name] }
  Bacula::Schedule <<| |>> { notify => Service[$director_service_name] }
  Bacula::Storage  <<| |>> { notify => Service[$director_service_name] }

}
