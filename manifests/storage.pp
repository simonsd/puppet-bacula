define bacula::storage (
  $config_root = $::bacula::params::config_root,
  $sd_server   = $::bacula::params::sd_server,
  $sd_port     = $::bacula::params::sd_port,
  $sd_password = $::bacula::params::sd_password,
  $device      = "${title}-dev",
  $media_type  = $::bacula::params::media_type,
) {

  file{"${config_root}/storage.d/${title}.conf":
    ensure  => 'file',
    content => template('bacula/storage.conf.erb'),
  }

}
