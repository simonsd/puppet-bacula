class bacula::firewall::fd {

  firewall{'020 bacula-fd':
    dport  => $fd_port,
    action => 'accept',
  }

}
