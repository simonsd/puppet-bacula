# /etc/puppet/modules/bacula/manifests/init.pp

class bacula::fd {
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

  service { "bacula-fd":
    ensure  => running,
    enable  => true,
    subscribe   => File["/etc/bacula/bacula-fd.conf"],
    require => File["/etc/bacula/bacula-fd.conf", "/var/lib/bacula", "/var/run/bacula"];
  }

  # Export resource for director
  @@bacula::client { "$fqdn":
    fqdn     => $fqdn,
    hostname => $hostname,
  }
}

class bacula::fd::xtrabackup {
  include repo::percona

  package { xtrabackup: 
    ensure	=> latest,
    require	=> Exec["percona_repo_rpm"];
  }
}
