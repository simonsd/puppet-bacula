class bacula::firewall::sd inherits ::bacula::params {

  firewall{'020 bacula-sd':
    dport  => $sd_port,
    action => 'accept',
  }

}
