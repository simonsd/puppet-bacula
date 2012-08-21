# = Class: bacula::storage::service
#
# Installs packages for bacula
#
# == Actions:
#
# Describe what packages get installed and when.
#
# == Requires:
#
# Requirements. This could be (external) packages that should be made available.
#
# == Sample Usage:
#
#   include bacula::storage::service
#
# == Todo:
#
# * Update documentation
#
class bacula::storage::service {
  service { 'bacula-sd':
    ensure    => running,
    enable    => true,
    hasstatus => $::operatingsystem ? {
      default   => undef,
      debian    => false,
    },
    require   => [ Package[bacula-storage-mysql], File['/etc/bacula/bacula-sd.conf'] ];
  }
}
