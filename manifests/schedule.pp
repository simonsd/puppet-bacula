define bacula::schedule (
  $name                  = undef,
  $description           = undef,
  $config_root           = $::bacula::params::config_root,
  $director_service_name = $::bacula::params::director_service_name,
) {

  file{"${config_root}/schedules.d/${name}.conf":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    notify  => Service[$director_service_name],
    content => template('bacula/schedule.conf.erb'),
  }

}
