define bacula::schedule (
  $name,
  $description
){
  file {
    "/etc/bacula/schedules.d/${name}.conf":
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0640',
      notify  => Service['bacula-dir'],
      content => template('bacula/schedule.erb');
  }
}
