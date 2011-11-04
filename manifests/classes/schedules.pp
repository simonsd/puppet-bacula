class bacula::schedules {
  file {
    '/etc/bacula/schedules.d':
      ensure => directory,
      owner => root,
      group => root,
      mode => 0640;
  }

  @bacula::schedule {
    'FullDaily':
      name => 'FullDaily',
      description => 'Full mon-sun at 03:00';

    'FullWeekly':
      name => 'FullWeekly',
      description => 'Full sun at 04:00';

    'IncDaily':
      name => 'IncDaily',
      description => 'Incremental mon-sun at 01:00';

    'IncWeekly':
      name => 'IncWeekly',
      description => 'Incremental sun at 06:00';

    'DiffDaily':
      name => 'DiffDaily',
      description => 'Differential mon-sun at 02:00';

    'DiffWeekly':
      name => 'DiffWeekly',
      description => 'Differential sun at 05:00';
  }

  if "${bacula::schedules}" != [] {
    realize(Bacula::Schedule["${bacula::schedules}"])
  }
}
