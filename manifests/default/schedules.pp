class bacula::default::schedules {

  @bacula::schedule{'FullDaily':
    name        => 'FullDaily',
    description => 'Full Daily at 03:00',
  }

  @bacula::schedule{'FullWeekly':
    name        => 'FullWeekly',
    description => 'Full sun at 04:00',
  }

  @bacula::schedule{'IncDaily':
    name        => 'IncDaily',
    description => 'Incremental Daily at 01:00',
  }

  @bacula::schedule{'IncWeekly':
    name        => 'IncWeekly',
    description => 'Incremental sun at 06:00',
  }

  @bacula::schedule{'DiffDaily':
    name        => 'DiffDaily',
    description => 'Differential Daily at 02:00',
  }

  @bacula::schedule{'DiffWeekly':
    name        => 'DiffWeekly',
    description => 'Differential sun at 05:00',
  }

  @bacula::schedule{'FullMonthlyDiffWeeklyIncDaily':
    name        => 'FullMonthlyDiffWeeklyIncDaily',
    description => ['Full 1st sun at 04:00', 'Differential 2nd-5th sun at 04:00', 'Incremental Daily at 04:00'],
  }

  @bacula::schedule{'FullWeeklyDiffDailyIncHourly':
    name        => 'FullWeeklyDiffDailyIncHourly',
    description => ['Full sun at 04:00', 'Differential mon-sat at 04:00', 'Incremental Hourly'],
  }

  @bacula::schedule{'FullWeeklyIncDaily':
    name        => 'FullWeeklyIncDaily',
    description => ['Full sun at 04:00', 'Incremental Daily at 04:00'],
  }

  if $schedules != [] {
    realize(Bacula::Schedule[$schedules])
  }

}
