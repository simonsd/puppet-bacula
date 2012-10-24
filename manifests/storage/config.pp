# = Class: bacula::storage::config
#
# Description of bacula::storage::config
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
class bacula::storage::config {

  file{'/etc/bacula/bacula-sd.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('bacula/bacula-sd.conf.erb'),
    notify  => Service['bacula-sd'],
    require => Package['bacula-storage-mysql'],
  }

  file{$::bacula::storage_dir:
    ensure  => directory,
    mode    => '0700',
  }

  Bacula::Device <<| |>>

}
