# = Class: bacula::sd::service
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
#   include bacula::sd::service
#
# == Todo:
#
# * Update documentation
#
class bacula::sd::service {

  service{$sd_service_name:
    ensure    => $sd_service_ensure,
    enable    => $sd_service_enable,
    hasstatus => $sd_service_hasstatus,
  }

}
