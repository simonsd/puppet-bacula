class bacula::default::jobs {

  @@bacula::job{'restore':
    type     => 'Restore',
    fileset  => 'FullSet',
    storage  => $::bacula::default_storage_server,
    pool     => 'Full',
    messages => 'Default',
  }

}
