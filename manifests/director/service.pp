class bacula::director::service {

  service{'bacula-dir':
    name      => $::operatingsystem ? {
      default => 'bacula-dir',
      debian  => 'bacula-director',
    },
    ensure    => 'running',
    enable    => true,
    hasstatus => $::operatingsystem ? {
      default => undef,
      debian  => false,
    },
    require   => [
      Package['bacula-director-mysql'],
      Service['mysqld']
    ],
  }

}
