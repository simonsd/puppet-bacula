define bacula::job (
  $client,
  $hostname = "${::hostname}",
  $fileset = '',
  $storage = "${hostname}-storage",
  $full_pool = "${hostname}FullPool",
  $incremental_pool = "${hostname}IncPool",
  $schedule = '',
  $client_run_before_job = false,
  $client_run_after_job = false,
  $server_run_before_job = false,
  $server_run_after_job = false,
  $jobdefs = 'DefaultJob'
){
  concat::fragment {
    "/etc/bacula/clients.d/${client}.conf-${name}":
      target => "/etc/bacula/clients.d/${client}.conf",
      content => template('bacula/job.erb'),
      order => '100';
  }
}
