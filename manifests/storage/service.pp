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

  service{$storage_service_name:
    ensure    => $storage_service_ensure,
    enable    => $storage_service_enable,
    hasstatus => $storage_service_hasstatus,
  }

}
