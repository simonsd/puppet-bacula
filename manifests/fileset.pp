define bacula::fileset (
  $name,
  $include,
  $exclude = [],
){

  file{"/etc/bacula/filesets.d/${name}.conf":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    notify  => Service['bacula-dir'],
    content => template('bacula/fileset.erb'),
  }

}
