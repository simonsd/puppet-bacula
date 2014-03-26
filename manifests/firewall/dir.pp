class bacula::firewall::dir inherits ::bacula::params {

  firewall{'020 bacula-dir':
    dport    => $director_port,
    source   => $director_firewall_source,
    iniface  => $director_firewall_outiface,
    outiface => $director_firewall_iniface,
    action   => 'accept',
  }

}
