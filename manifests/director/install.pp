class bacula::director::install (
  $pkg_name    = $::bacula::params::director_pkg_name,
  $pkg_version = $::bacula::params::director_pkg_version,
) inherits ::bacula::params {

  package{$pkg_name:
    ensure   => $pkg_version,
  }

  file{'/usr/sbin/bacula-dir.mysql':
    owner => 'root',
    group => 'root',
    mode  => '0755',
  }

}
