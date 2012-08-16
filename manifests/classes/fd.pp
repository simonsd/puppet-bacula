# /etc/puppet/modules/bacula/manifests/init.pp

class bacula::fd {
  package { 'bacula-client':
    ensure => latest
  }

  file {
    '/etc/bacula/bacula-fd.conf':
      owner   => 'root',
      group   => 'root',
      mode    => '0640',
      content => template('bacula/bacula-fd.conf.erb'),
      require => Package['bacula-client'];

    '/usr/sbin/bacula-fd':
      owner => 'root',
      group => 'root',
      mode  => '0755';

    '/var/lib/bacula':
      ensure  => directory,
      owner   => 'root',
      group   => 'root',
      mode    => '0700';

    '/var/run/bacula':
      ensure  => directory,
      owner   => 'root',
      group   => 'root',
      mode    => '0700';

    '/etc/logrotate.d/bacula':
      content => template('bacula/logrotate.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0644';

    '/var/log/bacula':
      ensure  => present,
      owner   => 'bacula',
      group   => 'bacula',
      mode    => '0644';

    '/var/log/bacula.log':
      ensure  => present,
      owner   => 'bacula',
      group   => 'bacula',
      mode    => '0644';
  }

  firewall{'021 bacula-fd':
    dport => '9102',
  }

  service { 'bacula-fd':
    ensure      => running,
    enable      => true,
    subscribe   => File['/etc/bacula/bacula-fd.conf'],
    require     => File['/etc/bacula/bacula-fd.conf', '/var/lib/bacula', '/var/run/bacula'];
  }

  # Export resource for director
  @@bacula::client { "${::fqdn}":
    fqdn     => "${::fqdn}",
    hostname => "${::hostname}",
  }
}

class bacula::fd::xtrabackup {
  include repo::percona

  package { 'xtrabackup':
    ensure   => 'latest',
    require  => Exec['percona_repo_rpm'];
  }
}
