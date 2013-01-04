# == Developers notes:
#
#   do not rename the bschedule param to schedule, it'll conflict with the
#   schedule param for the file resource in the concat module
#
define bacula::job (
  $client                = $::fqdn,
  $config_root           = $::bacula::params::config_root,
  $working_dir           = $::bacula::params::working_dir,
  $jobtype               = $::bacula::params::default_jobtype
  $storage               = $::bacula::params::default_storage,
  $pool                  = $::bacula::params::default_pool,
  $full_pool             = $::bacula::params::default_fullpool,
  $incremental_pool      = $::bacula::params::default_incrementalpool,
  $jobdefs               = $::bacula::params::default_jobdefs,
  $fileset               = undef,
  $bschedule             = undef,
  $client_run_before_job = undef,
  $client_run_after_job  = undef,
  $server_run_before_job = undef,
  $server_run_after_job  = undef,
  $messages              = undef,
) {

  concat::fragment{"${config_root}/clients.d/${client}.conf-${name}":
    target  => "${config_root}/clients.d/${client}.conf",
    content => template('bacula/job.conf.erb'),
    order   => '100',
  }

}
