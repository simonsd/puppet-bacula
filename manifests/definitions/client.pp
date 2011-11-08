define bacula::client (
	$fqdn,
	$hostname
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
