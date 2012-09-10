class bacula::firewall::fd {

  firewall{'021 bacula-fd':
    dport  => '9102',
    action => 'accept',
  }

}
