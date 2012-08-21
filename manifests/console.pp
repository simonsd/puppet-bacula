# /etc/puppet/modules/bacula/manifests/console.pp

class bacula::console {
  package { 'bacula-console':
    ensure => latest;
  }

  file { '/etc/bacula/bconsole.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('bacula/bconsole.conf.erb'),
    require => Package['bacula-console'];
  }
}
