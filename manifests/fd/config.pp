class bacula::fd::config {

  File{
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
  }

  file{"${::bacula::config_root}/bacula-fd.conf":
    mode    => '0640',
    content => template('bacula/bacula-fd.conf.erb'),
    require => Package['bacula-client'],
  }

  file{'/usr/sbin/bacula-fd':
    mode  => '0755',
  }

  file{'/var/lib/bacula':
    ensure => directory,
    mode   => '0700',
  }

  file{'/var/run/bacula':
    ensure => directory,
    mode   => '0700',
  }

  file{'/var/log/bacula':
    ensure => 'directory',
    mode   => '0644',
  }

  file{'/var/log/bacula.log':
    mode => '0644',
  }

  file{'/etc/logrotate.d/bacula':
    content => template('bacula/logrotate.erb'),
    mode    => '0644',
  }

  # Export client resource for director
  @@bacula::client{$::fqdn:;}

}
