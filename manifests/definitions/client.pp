define bacula::client (
	$fqdn,
	$hostname,
	$storage_server = "${bacula::storage_server}.${domain}",
	$storage_password = "${bacula::storage_password}"
) {
  concat {
    "/etc/bacula/clients.d/${hostname}.conf":
      owner => root,
      group => root,
      mode => 0640,
      notify => service['bacula-dir'];
  }

  concat::fragment {
    "/etc/bacula/clients.d/${hostname}.conf-client":
      target => "/etc/bacula/clients.d/${hostname}.conf",
      content => template('bacula/client.erb'),
      order => 01;
  }
}
