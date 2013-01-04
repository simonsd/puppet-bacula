class bacula::default::jobs {

  @@bacula::job{'restore':
    jobtype  => 'Restore',
    fileset  => 'FullSet',
  }

}
