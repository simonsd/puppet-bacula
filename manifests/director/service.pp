class bacula::director::service (
  $service_name = $::bacula::params::director_service_name,
  $ensure       = $::bacula::params::director_service_ensure,
  $enable       = $::bacula::params::director_service_enable,
  $hasstatus    = $::bacula::params::director_service_hasstatus,
) inherits ::bacula::params {

  service{$service_name:
    ensure    => $ensure,
    enable    => $enable,
    hasstatus => $hasstatus,
  }

}
