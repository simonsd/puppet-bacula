class bacula::director::service {

  service{$director_service_name:
    ensure    => $director_service_ensure,
    enable    => $director_service_enable,
    hasstatus => $director_service_hasstatus,
  }

}
