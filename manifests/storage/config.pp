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

  file{"${config_root}/bacula-sd.conf":
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('bacula/bacula-sd.conf.erb'),
    notify  => Service[$storage_service_name],
  }

  file{"${log_dir}/bacula-sd.log":
    mode => '0644',
  }

  file{$storage_dir:
    ensure  => directory,
    mode    => '0700',
  }

  file{"${config_root}/devices.d":
    ensure => directory,
  }

  Bacula::Device <<| $device_collect_filter |>> { notify => Service[$storage_service_name] }

}
