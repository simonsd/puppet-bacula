# == Todo:
#
# TODO: warning: schedule is a metaparam; this value will inherit to all
#       contained resources
#
define bacula::jobdefs (
  $name,
  $level                 = 'Incremental',
  $fileset               = 'FullSet',
  $schedule              = 'FullWeekly',
  $messages              = undef,
  $pool                  = 'Default',
  $priority              = '10',
  $type                  = 'Backup',
  $config_root           = $::bacula::params::config_root,
  $director_service_name = $::bacula::params::director_service_name,
){

  file{"${config_root}/jobdefs.d/${name}.conf":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    notify  => Service[$director_service_name],
    content => template('bacula/jobdefs.conf.erb'),
  }

}
