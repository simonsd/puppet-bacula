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
# TODO: Remove nfs package installation from here.
#       Depend on whatever nfs module to do this.
# TODO: Put the packages in a params class.
#
class bacula::storage::install {

  ## Packages we need to install.
  $bacula_storage_mysql_pkg = $::operatingsystem ? {
    default => 'bacula-storage-mysql',
    debian  => 'bacula-sd-mysql',
  }
  $nfs_utils_pkg = $::operatingsystem ? {
    default => 'nfs-utils',
    debian  => 'nfs-client',
  }


  package {'bacula-storage-mysql':
    ensure => installed,
    name   => $bacula_storage_mysql_pkg,
  }
  package {'nfs-utils':
    ensure => installed,
    name   => $nfs_utils_pkg,
  }
}
