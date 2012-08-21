# = Class: bacula::fd::xtrabackup
#
# Description of bacula::fd::xtrabackup
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
# TODO: Update documentation.
# TODO: Remove dependency on repo::percona.
#
class bacula::fd::xtrabackup {

  include repo::percona

  package { 'xtrabackup':
    ensure   => 'latest',
    require  => Exec['percona_repo_rpm'];
  }
}
