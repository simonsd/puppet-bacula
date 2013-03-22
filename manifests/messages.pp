define bacula::messages (
  $config_root     = $::bacula::params::config_root,
  $log_dir         = $::bacula::params::log_dir,
  $log_file        = '',
  $messages        = ['append', 'all'],
  $mailcommand     = $::bacula::params::messages_mailcommand,
  $operatorcommand = $::bacula::params::messages_operatorcommand,
) {

  require ::bacula::params

  $_log_file = $log_file ? {
    ""      => "${log_dir}/${title}.log",
    default => $log_file,
  }

  file{$_log_file:
    ensure => 'present',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }

  file{"${config_root}/messages.d/${name}.conf":
    content => template('bacula/messages.conf.erb'),
  }

}
