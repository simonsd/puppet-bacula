class bacula::fd::config {

  File{
    ensure => 'file',
    owner  => $user,
    group  => $group,
  }

  file{"${config_root}/bacula-fd.conf":
    mode    => '0640',
    content => template('bacula/bacula-fd.conf.erb'),
    require => Package[$pkgname],
  }

  file{'/usr/sbin/bacula-fd':
    mode  => '0755',
  }

  file{"${log_dir}/bacula-fd.log":
    mode => '0644',
  }

  # Export client resource for director
  @@bacula::client{$client:;}

}
