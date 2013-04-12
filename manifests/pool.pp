define bacula::pool (
  $pool_type             = 'Backup',
  $recycle               = true,
  $autoprune             = true,
  $purge_oldest          = true,
  $maximum_volume_jobs   = '1',
  $maximum_volumes       = '4',
  $config_root           = $::bacula::params::config_root,
  $director_service_name = $::bacula::params::director_service_name,
) {

  require ::bacula::params

  $_recycle = $recycle ? {
    true  => 'yes',
    false => 'no',
  }

  $_autoprune = $autoprune ? {
    true  => 'yes',
    false => 'no',
  }

  $_purge_oldest = $purge_oldest ? {
    true  => 'yes',
    false => 'no',
  }

  file{"${config_root}/pools.d/${title}.conf":
    ensure  => 'file',
    mode    => '0640',
    notify  => Service[$director_service_name],
    content => template('bacula/pool.conf.erb'),
  }

}
