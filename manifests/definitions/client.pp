define bacula::client (
	$fqdn,
	$hostname
) {
  concat {
    "/etc/bacula/clients.d/${hostname}.conf":
      owner => root,
      group => root,
      mode => 0640,
      notify => service['bacula-dir'],
      content => template('bacula/client.erb', 'bacula/job.erb');
  }
}
