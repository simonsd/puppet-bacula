class bacula::fd::install (
  $pkg_name    = $::bacula::params::fd_pkg_name,
  $pkg_version = $::bacula::params::fd_pkg_version,
) inherits ::bacula::params {

  package{$pkg_name:
    ensure => $pkg_version,
  }

}
