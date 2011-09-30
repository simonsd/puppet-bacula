# /etc/puppet/modules/bacula/manifests/init.pp

class bacula::client {
  include bacula::config
  include bacula::console

  package { bacula-client: 
    ensure => latest
  }

  file { 
    "/etc/bacula/bacula-fd.conf":
      owner   => "root",
      group   => "root",
      mode    => 640,
      content => template("bacula/bacula-fd.conf.erb"),
      require => Package["bacula-client"];

    "/usr/sbin/bacula-fd":
      owner => "root",
      group => "root",
      mode  => 755;

    "/var/lib/bacula":
      ensure  => directory,
      owner   => "root",
      group   => "root",
      mode    => 700;

    "/var/run/bacula":
      ensure  => directory,
      owner   => "root",
      group   => "root",
      mode    => 700;

    "/etc/logrotate.d/bacula":
      source  => 'puppet:///modules/bacula/logrotate',
      owner   => "root",
      group   => "root",
      mode    => 644;
  }

  concat::fragment { "/etc/sysconfig/iptables.bacula.client":
    target  => "/etc/sysconfig/iptables",
    source  => 'puppet:///modules/bacula/iptables.client',
    order   => 200,
  }

  exec { "/etc/init.d/bacula-fd restart":
    subscribe   => File["/etc/bacula/bacula-fd.conf"],
    require     => File["/etc/bacula/bacula-fd.conf", "/var/lib/bacula", "/var/run/bacula"],
    refreshonly => true;
  }

  service { "bacula-fd":
    ensure  => running,
    enable  => true,
    require => File["/etc/bacula/bacula-fd.conf", "/var/lib/bacula", "/var/run/bacula"];
  }

  # Export resource for director
  @@baculaclient { "$fqdn":
    fqdn     => $fqdn,
    hostname => $hostname,
  }
}

class bacula::client::xtrabackup {
  include repo::percona

  package { xtrabackup: 
    ensure	=> latest,
    require	=> Exec["percona_repo_rpm"];
  }
}
