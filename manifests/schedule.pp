define bacula::schedule (
  $name,
  $description,
) {

  file{"${::bacula::config_root}/schedules.d/${name}.conf":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    notify  => Service['bacula-dir'],
    content => template('bacula/schedule.erb'),
  }

}
