# /etc/puppet/modules/bacula/manifests/console.pp

class bacula::console {
  include bacula::config

  package { bacula-console:
    ensure => latest;
  }

  file { "/etc/bacula/bconsole.conf":
    owner   => "root",
    group   => "root",
    mode    => 640,
    content => template("bacula/bconsole.conf.erb"),
    require => Package["bacula-console"];
  }
}
