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
      description => 'Full Daily at 03:00';

    'FullWeekly':
      name => 'FullWeekly',
      description => 'Full sun at 04:00';

    'IncDaily':
      name => 'IncDaily',
      description => 'Incremental Daily at 01:00';

    'IncWeekly':
      name => 'IncWeekly',
      description => 'Incremental sun at 06:00';

    'DiffDaily':
      name => 'DiffDaily',
      description => 'Differential Daily at 02:00';

    'DiffWeekly':
      name => 'DiffWeekly',
      description => 'Differential sun at 05:00';

    'FullMonthlyDiffWeeklyIncDaily':
      name => 'FullMonthlyDiffWeeklyIncDaily',
      description => ['Full 1st sun at 04:00', 'Diff 2nd-5th sun at 04:00', 'Inc Daily at 04:00'];

    'FullWeeklyDiffDailyIncHourly':
      name => 'FullWeeklyDiffDailyIncHourly',
      description => ['Full sun at 04:00', 'Diff mon-sat at 04:00', 'Inc Hourly'];

    'FullWeeklyIncDaily':
      name => 'FullWeeklyIncDaily',
      description => ['Full sun at 04:00', 'Inc Daily at 04:00'];
  }

  if "${bacula::schedules}" != [] {
    realize(Bacula::Schedule[$bacula::schedules])
  }
}
