define bacula::job (
  $client,
  $hostname = "${::hostname}"
){
  File {
    "/etc/bacula/clients.d/${client}.conf":
      content +> template('job.erb');
  }
}
