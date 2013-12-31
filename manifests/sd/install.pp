class bacula::sd::install (
  $pkg_name    = $::bacula::params::sd_pkg_name,
  $pkg_version = $::bacula::params::sd_pkg_version,
) inherits ::bacula::params {

  package{$pkg_name:
    ensure => $pkg_version,
  }

}
