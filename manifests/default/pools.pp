class bacula::default::pools {

  Bacula::Pool{
    recycle             => true,
    autoprune           => true,
    purge_oldest        => true,
    maximum_volume_jobs => '1',
  }

  @@bacula::pool{'Full':
    maximum_volumes     => '4',
  }

  @@bacula::pool{'Differential':
    maximum_volumes     => '7',
  }

  @@bacula::pool{'Incremental':
    maximum_volumes     => '7',
  }

}
