class bacula::fd::service {

  service{'bacula-fd':
    ensure    => 'running',
    enable    => true,
    subscribe => File["${::bacula::config_root}/bacula-fd.conf"],
    require   => File[
      "${::bacula::config_root}/bacula-fd.conf",
      '/var/lib/bacula',
      '/var/run/bacula',
    ],
  }

}
