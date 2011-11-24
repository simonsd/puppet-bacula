# /etc/puppet/modules/bacula/manifests/init.pp

class bacula::storage {
  include concat::setup
  include bacula::storage::install
  include bacula::storage::config
  include bacula::storage::service
}

class bacula::storage::install {
  package { 
    bacula-storage-mysql:
      ensure => installed;
    nfs-utils:
      ensure  => installed;
  }
}

class bacula::storage::config {
  file { 
    "/etc/bacula/bacula-sd.conf":
      owner   => "root",
      group   => "root",
      mode    => 640,
      content => template("bacula/bacula-sd.conf.erb"),
      notify  => Service['bacula-sd'],
      require => Package["bacula-storage-mysql"];

    "${storage_dir}":
      ensure  => directory,
      owner   => "root",
      group   => "root",
      mode    => 700;
  }

  iptables::rule {
    'bacula-sd':
      dport => '9103';
  }
}

class bacula::storage::service {
  service { "bacula-sd":
    ensure  => running,
    enable  => true,
    require => [ Package[bacula-storage-mysql], File["/etc/bacula/bacula-sd.conf"] ];
  }
}
