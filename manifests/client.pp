# == Todo:
#
# TODO: Maybe we need to use other param names for fqdn and hostname.
#       These are also top scope variables: avoid confusion where possible
#
define bacula::client (
  $fqdn,
  $hostname,
  $storage_server = "${::bacula::default_storage_server}.${::domain}",
  $storage_label = $::bacula::default_storage_label,
  $storage_password = $::bacula::default_storage_password,
  $device_owner = $::bacula::default_device_owner,
  $device_group = $::bacula::default_device_group,
) {
  concat {
    "/etc/bacula/clients.d/${hostname}.conf":
      owner  => 'root',
      group  => 'root',
      mode   => '0640',
      notify => Service['bacula-dir'];
  }

  concat::fragment {
    "/etc/bacula/clients.d/${hostname}.conf-client":
      target  => "/etc/bacula/clients.d/${hostname}.conf",
      content => template('bacula/client.erb'),
      order   => 01;
  }

  @@bacula::device {
    $hostname:
      path => "/mnt/backup/${hostname}",
      owner => $device_owner,
      group => $device_group,
  }
}
