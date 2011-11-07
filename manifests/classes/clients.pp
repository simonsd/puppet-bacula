class bacula::clients {
  file {
    '/etc/bacula/clients.d':
      ensure => directory,
      owner => root,
      group => root,
      mode => 0640;
  }

  bacula::client {
    'bacula':
      fqdn => "${bacula::director_server}.${domain}",
      hostname => "${bacula::director_server}";
  }
}
