define bacula::client (
	$fqdn,
	$hostname
) {
  file {
    "/etc/bacula/clients.d/${hostname}.conf":
      content => template('bacula/client.erb', 'bacula/job.erb');
  }
}
