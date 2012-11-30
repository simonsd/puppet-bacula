class bacula::director::service {

  service{$::bacula::director_service:
    ensure    => 'running',
    enable    => true,
    hasstatus => $::bacula::params::director_hasstatus,
  }

}
