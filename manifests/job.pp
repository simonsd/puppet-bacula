# == Developers notes:
#
#   do not rename the bschedule param to schedule, it'll conflict with the
#   schedule param for the file resource in the concat module
#
define bacula::job (
  $client                = $::fqdn,
  $type                  = 'Backup',
  $fileset               = undef,
  $storage               = "${::fqdn}-storage",
  $pool                  = $bacula::default_pool,
  $full_pool             = "${::fqdn}FullPool",
  $incremental_pool      = "${::fqdn}IncPool",
  $bschedule             = undef,
  $client_run_before_job = undef,
  $client_run_after_job  = undef,
  $server_run_before_job = undef,
  $server_run_after_job  = undef,
  $jobdefs               = 'DefaultJob',
  $messages              = 'Default',
  $config_root           = $::bacula::params::config_root,
  $working_dir           = $::bacula::params::working_dir,
) {

  concat::fragment{"${config_root}/clients.d/${client}.conf-${name}":
    target  => "${config_root}/clients.d/${client}.conf",
    content => template('bacula/job.conf.erb'),
    order   => '100',
  }

}
