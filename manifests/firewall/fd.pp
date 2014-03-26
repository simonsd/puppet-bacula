class bacula::firewall::fd inherits ::bacula::params {

  firewall{'020 bacula-fd':
    dport    => $fd_port,
    source   => $fd_firewall_source,
    iniface  => $fd_firewall_outiface,
    outiface => $fd_firewall_iniface,
    action   => 'accept',
  }

}
