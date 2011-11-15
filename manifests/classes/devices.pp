class bacula::devices {
  file {
    '/etc/bacula/devices.d':
      ensure => directory;
  }
}
