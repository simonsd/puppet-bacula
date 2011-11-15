class bacula::bat {
  package {
    'bacula-console-bat':
      ensure => latest,
      require => Class['bacula::console'];
  }

  file {
    '/etc/bacula/bat.conf':
      ensure => present,
      content => template('bacula/bat.conf.erb'),
      require => Package['bacula-console-bat'];
  }
}
