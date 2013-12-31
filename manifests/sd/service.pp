class bacula::sd::service (
  $name      = $::bacula::params::sd_service_name,
  $ensure    = $::bacula::params::sd_service_ensure,
  $enable    = $::bacula::params::sd_service_enable,
  $hasstatus = $::bacula::params::sd_service_hasstatus,
) inherits ::bacula::params {

  service{$name:
    ensure    => $ensure,
    enable    => $enable,
    hasstatus => $hasstatus,
  }

}
