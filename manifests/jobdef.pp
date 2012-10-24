# == Todo:
#
# TODO: warning: schedule is a metaparam; this value will inherit to all
#       contained resources
#
define bacula::jobdef (
  $name,
  $level    = 'Incremental',
  $fileset  = 'FullSet',
  $schedule = 'FullWeekly',
  $messages = 'Standard',
  $pool     = 'Default',
  $priority = '10'
){

  file{"/etc/bacula/jobdefs.d/${name}.conf":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    notify  => Service['bacula-dir'],
    content => template('bacula/jobdefs.erb'),
  }

}
