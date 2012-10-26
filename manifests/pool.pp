define bacula::pool (
  $pool_type           = 'Backup',
  $recycle             = true,
  $autoprune           = true,
  $purge_oldest        = true,
  $maximum_volume_jobs = '1',
  $maximum_volumes     = '4',
) {

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

  file{"${::bacula::config_root}/pools.d/${title}.conf":
    ensure  => present,
    mode    => '0640',
    content => template('bacula/pool.conf.erb'),
  }

}
