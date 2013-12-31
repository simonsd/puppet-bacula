class bacula::director::service (
  $name      = $::bacula::params::director_service_name,
  $ensure    = $::bacula::params::director_service_ensure,
  $enable    = $::bacula::params::director_service_enable,
  $hasstatus = $::bacula::params::director_service_hasstatus,
) inherits ::bacula::params {

  service{$name:
    ensure    => $ensure,
    enable    => $enable,
    hasstatus => $hasstatus,
  }

}
