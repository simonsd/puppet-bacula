class bacula::fd::service {

  service{$fd_service_name:
    ensure    => $fd_service_ensure,
    enable    => $fd_service_enable,
    hasstatus => $fd_service_hasstatus,
  }

}
