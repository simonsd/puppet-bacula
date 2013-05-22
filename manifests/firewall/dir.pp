class bacula::firewall::dir inherits ::bacula::params {

  firewall{'020 bacula-dir':
    dport  => $director_port,
    action => 'accept',
  }

}
