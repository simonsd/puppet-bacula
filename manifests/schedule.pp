define bacula::schedule (
  $description           = false,
  $config_root           = $::bacula::params::config_root,
  $director_service_name = $::bacula::params::director_service_name,
) {

  require ::bacula::params

  file{"${config_root}/schedules.d/${title}.conf":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    notify  => Service[$director_service_name],
    content => template('bacula/schedule.conf.erb'),
  }

}
