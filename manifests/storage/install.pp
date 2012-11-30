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
# TODO: Put the packages in a params class.
#
class bacula::storage::install {

  ## Packages we need to install.
  $bacula_storage_mysql_pkg = $::operatingsystem ? {
    default => 'bacula-storage-mysql',
    debian  => 'bacula-sd-mysql',
  }

  package{'bacula-storage-mysql':
    ensure => installed,
    name   => $bacula_storage_mysql_pkg,
  }

}
