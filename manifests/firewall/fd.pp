class bacula::firewall::fd inherits ::bacula::params {

  firewall{'020 bacula-fd':
    dport  => $fd_port,
    action => 'accept',
  }

}
