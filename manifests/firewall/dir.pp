class bacula::firewall::dir {

  firewall{'020 bacula-dir':
    dport  => $director_port,
    action => 'accept',
  }

}
