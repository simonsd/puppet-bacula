class bacula::devices {

  file{'/etc/bacula/devices.d':
    ensure => directory,
  }

  @@bacula::device{'catalog':
    path => '/mnt/backup/catalog',
  }

}
