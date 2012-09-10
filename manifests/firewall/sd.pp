class bacula::firewall::sd {

  firewall{'022 bacula-sd':
    dport  => '9103',
    action => 'accept',
  }

}
