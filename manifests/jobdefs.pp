# == Todo:
#
# TODO: warning: schedule is a metaparam; this value will inherit to all
#       contained resources
#
define bacula::jobdefs (
  $name,
  $level                 = 'Incremental',
  $fileset               = $::bacula::params::default_fileset,
  $schedule              = $::bacula::params::default_schedule,
  $messages              = false,
  $pool                  = $::bacula::params::default_pool,
  $priority              = '10',
  $jobtype               = $::bacula::params::default_jobtype,
  $config_root           = $::bacula::params::config_root,
  $director_service_name = $::bacula::params::director_service_name,
){

  file{"${config_root}/jobdefs.d/${name}.conf":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    notify  => Service[$director_service_name],
    content => template('bacula/jobdefs.conf.erb'),
  }

}
