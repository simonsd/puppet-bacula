class bacula::common {

  include ::concat::setup
  include ::bacula::bconsole

  File{
    ensure => 'directory',
    owner  => $user,
    group  => $group,
    mode   => '0700',
  }

  file{$config_root:}
  file{$working_dir:}
  file{$pid_dir:}
  file{$log_dir:
    mode => '0644',
  }

  file{'/etc/logrotate.d/bacula':
    ensure  => 'file',
    mode    => '0644',
    content => template('bacula/logrotate.erb'),
  }

}
