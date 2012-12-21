define bacula::schedule (
  $name        = undef,
  $description = undef,
) {

  file{"${::bacula::config_root}/schedules.d/${name}.conf":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    notify  => Service['bacula-dir'],
    content => template('bacula/schedule.conf.erb'),
  }

}
