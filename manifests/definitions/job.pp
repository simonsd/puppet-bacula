define bacula::job (
  $client,
  $hostname = "${::hostname}",
  $jobdefs = 'DefaultJob'
){
  concat::fragment {
    "/etc/bacula/clients.d/${client}.conf-${name}":
      target => "/etc/bacula/clients.d/${client}.conf",
      content => template('bacula/job.erb'),
      order => '100';
  }
}
