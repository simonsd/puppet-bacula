class bacula::fd::service (
  $service_name = $::bacula::params::fd_service_name,
  $ensure       = $::bacula::params::fd_service_ensure,
  $enable       = $::bacula::params::fd_service_enable,
  $hasstatus    = $::bacula::params::fd_service_hasstatus,
) inherits ::bacula::params {

  service{$service_name:
    ensure    => $ensure,
    enable    => $enable,
    hasstatus => $hasstatus,
  }

}
