class bacula::fd::config {

  file{"${::bacula::config_root}/bacula-fd.conf":
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('bacula/bacula-fd.conf.erb'),
    require => Package['bacula-client'],
  }

  file{'/usr/sbin/bacula-fd':
    owner => 'root',
    group => 'root',
    mode  => '0755',
  }

  file{'/var/lib/bacula':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  file{'/var/run/bacula':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  file{'/etc/logrotate.d/bacula':
    content => template('bacula/logrotate.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  file{'/var/log/bacula':
    ensure => present,
    owner  => 'bacula',
    group  => 'bacula',
    mode   => '0644',
  }

  file{'/var/log/bacula.log':
    ensure => present,
    owner  => 'bacula',
    group  => 'bacula',
    mode   => '0644',
  }

  # Export resource for director
  @@bacula::client{$::fqdn:;}

}
