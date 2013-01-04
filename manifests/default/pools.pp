class bacula::default::pools {

  Bacula::Pool{
    recycle             => true,
    autoprune           => true,
    purge_oldest        => true,
    maximum_volume_jobs => '1',
  }

  @@bacula::pool{'FullPool':
    maximum_volumes     => '4',
  }

  @@bacula::pool{'DifferentialPool':
    maximum_volumes     => '7',
  }

  @@bacula::pool{'IncrementalPool':
    maximum_volumes     => '7',
  }

}
