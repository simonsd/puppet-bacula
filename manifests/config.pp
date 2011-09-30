# /etc/puppet/modules/bacula/manifests/config.pp

class bacula::config {
  $admin_email = "$system_admin_email"
  $operator_email = "$system_admin_email"

  $director_server = "sartre"
  $director_label = "bacula-dir"
  $director_password = "default"

  $storage_server = "lessing"
  $storage_label = "bacula-sd"
  $storage_password = "default"

  $dbname = "bacula"
  $dbuser = "bacula"
  $dbpassword = "default"

  # Bacula bweb user / passwd
  $bweb_user = "baculaadmin"
  $bweb_passwd = "default"
}

define baculaclient($fqdn,$hostname) {
  concat::fragment { "$hostname-job":
    target  => "/etc/bacula/bacula-dir.conf",
    content => template("bacula/bacula-dir.conf.job.erb"),
    order   => 200,
  }

  concat::fragment { "$hostname-client":
    target  => "/etc/bacula/bacula-dir.conf",
    content => template("bacula/bacula-dir.conf.client.erb"),
    order   => 210,
  }
}