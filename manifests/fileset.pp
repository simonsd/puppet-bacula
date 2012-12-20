define bacula::fileset (
  $include,
  $exclude     = [],
  $config_root = $::bacula::params::config_root,
){

  file{"${config_root}/filesets.d/${name}.conf":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('bacula/fileset.erb'),
  }

}
