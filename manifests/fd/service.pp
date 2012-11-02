class bacula::fd::service {

  service{'bacula-fd':
    ensure    => 'running',
    enable    => true,
    subscribe => File["${config_root}/bacula-fd.conf"],
    require   => File[
      "${config_root}/bacula-fd.conf",
      '/var/lib/bacula',
      '/var/run/bacula'
    ],
  }

}
