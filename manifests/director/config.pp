class bacula::director::config {

  File{
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  file{"${config_root}/catalog.d":}
  file{"${config_root}/clients.d":}
  file{"${config_root}/filesets.d":}
  file{"${config_root}/schedules.d":}
  file{"${config_root}/jobdefs.d":}
  file{"${config_root}/pools.d":}
  file{"${config_root}/storage.d":}

  file{"${config_root}/bacula-dir.conf":
    ensure  => 'file',
    content => template('bacula/bacula-dir.conf.erb'),
    notify  => Service[$director_service],
  }

  file{"${log_dir}/bacula-dir.log":
    ensure => 'file',
    mode   => '0644',
  }

}
