# = Class: bacula::storage::install
#
# Description of bacula::storage::install
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
class bacula::storage::install {

  package{$::bacula::params::storage_pkgname:
    ensure => installed,
  }

}
