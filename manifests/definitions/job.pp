define bacula::job (
  $client,
  $hostname = "${::hostname}"
){
  concat::fragment {
    "/etc/bacula/clients.d/${client}.conf":
      target => "/etc/bacula/clients.d/${client}.conf",
      content => template('bacula/job.erb'),
      order => '100';
  }
}
