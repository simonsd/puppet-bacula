class bacula::default::jobs {

  @@bacula::job{'restore':
    jobtype  => 'Restore',
    fileset  => 'FullSet',
    storage  => $::bacula::default_storage_server,
    pool     => 'Full',
  }

}
