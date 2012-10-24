class bacula::clients {

  file{'/etc/bacula/clients.d':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

}
