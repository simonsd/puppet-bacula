class bacula::firewall::sd {

  firewall{'020 bacula-sd':
    dport  => $sd_port,
    action => 'accept',
  }

}
