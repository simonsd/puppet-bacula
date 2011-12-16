define bacula::job (
  $client,
  $hostname = "${::hostname}",
  $fileset = '',
  $storage = "${hostname}-storage",
  $full_pool = "${hostname}FullPool",
  $incremental_pool = "${hostname}IncPool",
# do not rename this to schedule, it'll conflict with the schedule param
# for the file resource in the concat module ;)
  $bschedule = '',
  $client_run_before_job = '',
  $client_run_after_job = '',
  $server_run_before_job = '',
  $server_run_after_job = '',
  $jobdefs = 'DefaultJob'
){
  concat::fragment {
    "/etc/bacula/clients.d/${client}.conf-${name}":
      target => "/etc/bacula/clients.d/${client}.conf",
      content => template('bacula/job.erb'),
      order => '100';
  }
}
