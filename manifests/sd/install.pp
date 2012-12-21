# = Class: bacula::sd::install
#
# Description of bacula::sd::install
#
# == Parameters:
#
# $param::   description of parameter. default value if any.
#
# == Actions:
#
# Describe what this class does. What gets configured and how.
#
# == Requires:
#
# Requirements. This could be packages that should be made available.
#
# == Sample Usage:
#
# == Todo:
#
# TODO: Update documentation
#
class bacula::sd::install {

  package{$::bacula::params::sd_pkgname:
    ensure => installed,
  }

}
