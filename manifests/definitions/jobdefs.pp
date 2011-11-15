define bacula::jobdef (
  $name,
  $level = 'Incremental',
  $fileset = 'FullSet',
  $schedule = 'FullWeeklyIncDaily',
  $storage,
  $messages = 'Standard',
  $pool = 'Default',
  $priority = '10'
){
  file {
    "/etc/bacula/jobdefs.d/${name}.conf":
      ensure => present,
      owner => 'root',
      group => 'root',
      mode => '0640',
      notify => Service['bacula-dir'],
      content => template('bacula/jobdefs.erb');
  }
}
