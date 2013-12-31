class bacula::sd::service (
  $service_name = $::bacula::params::sd_service_name,
  $ensure       = $::bacula::params::sd_service_ensure,
  $enable       = $::bacula::params::sd_service_enable,
  $hasstatus    = $::bacula::params::sd_service_hasstatus,
) inherits ::bacula::params {

  service{$service_name:
    ensure    => $ensure,
    enable    => $enable,
    hasstatus => $hasstatus,
  }

}
