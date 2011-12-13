define bacula::job (
  $client,
  $hostname = "${::hostname}",
  $fileset = '',
  $storage = "${hostname}-storage",
  $full_pool = "${hostname}FullPool",
  $incremental_pool = "${hostname}IncPool",
  $schedule = ''
  $jobdefs = 'DefaultJob'
){
  concat::fragment {
    "/etc/bacula/clients.d/${client}.conf-${name}":
      target => "/etc/bacula/clients.d/${client}.conf",
      content => template('bacula/job.erb'),
      order => '100';
  }
}
