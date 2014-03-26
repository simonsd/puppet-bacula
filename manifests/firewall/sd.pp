class bacula::firewall::sd inherits ::bacula::params {

  firewall{'020 bacula-sd':
    dport    => $sd_port,
    source   => $sd_firewall_source,
    iniface  => $sd_firewall_outiface,
    outiface => $sd_firewall_iniface,
    action   => 'accept',
  }

}
