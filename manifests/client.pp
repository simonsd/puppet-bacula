define bacula::client (
  $fqdn,
  $hostname,
  $storage_server = "${::bacula::default_storage_server}.${::domain}",
  $storage_label = $::bacula::default_storage_label,
  $storage_password = $::bacula::default_storage_password
) {
  concat {
    "/etc/bacula/clients.d/${::hostname}.conf":
      owner  => 'root',
      group  => 'root',
      mode   => '0640',
      notify => Service['bacula-dir'];
  }

  concat::fragment {
    "/etc/bacula/clients.d/${::hostname}.conf-client":
      target  => "/etc/bacula/clients.d/${::hostname}.conf",
      content => template('bacula/client.erb'),
      order   => 01;
  }

  @@bacula::device {
    $::hostname:
      path => "/mnt/backup/${::hostname}";
  }
}
