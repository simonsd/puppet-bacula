class bacula::firewall::dir {

  firewall{'020 bacula-dir':
    dport  => '9101',
    action => 'accept',
  }

}
