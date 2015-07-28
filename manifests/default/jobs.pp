class bacula::default::jobs inherits ::bacula::params {

  @bacula::job{'RestoreFiles':
    name     => 'RestoreFiles',
    jobtype  => 'Restore',
    fileset  => $default_fileset,
    pool     => $default_pool,
    messages => $fd_messages,
    storage  => $default_storage,
  }

  if $jobs != [] {
    realize(Bacula::Job[$jobs])
  }

}