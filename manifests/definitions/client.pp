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
