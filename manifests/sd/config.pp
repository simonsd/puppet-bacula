# = Class: bacula::sd::config
#
# Description of bacula::sd::config
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
class bacula::sd::config inherits ::bacula::sd {

  file{"${config_root}/bacula-sd.conf":
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('bacula/bacula-sd.conf.erb'),
    notify  => Service[$sd_service_name],
  }

  ::bacula::messages{'bacula-sd':}

  file{$storage_dir:
    ensure  => directory,
    mode    => '0700',
  }

  file{"${config_root}/devices.d":
    ensure => directory,
  }

  Bacula::Device <<| |>> { notify => Service[$sd_service_name] }

}
