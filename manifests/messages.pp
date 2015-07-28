define bacula::messages (
  $config_root     = $::bacula::params::config_root,
  $log_dir         = $::bacula::params::log_dir,
  $log_file        = '',
  $messages        = '',
  $mail            = '',
  $catalog         = 'all, !skipped',
  $mailcommand     = $::bacula::params::messages_mailcommand,
  $operatorcommand = $::bacula::params::messages_operatorcommand,
) {

  require ::bacula::params

  $_log_file = $log_file ? {
    ""      => "${log_dir}/${title}.log",
    default => $log_file,
  }

  $_messages = $messages ? {
    ""      => [['append', $_log_file, 'all, !skipped']],
    default => $messages,
  }

  File{
    ensure => 'file',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }

  file{$_log_file:}

  file{"${config_root}/messages.d/${name}.conf":
    content => template('bacula/messages.conf.erb'),
    notify  => Service[$::bacula::params::fd_service_name],
  }

}
