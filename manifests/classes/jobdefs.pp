class bacula::jobdefs {
  @bacula::jobdefs {
    'DefaultJob':
      name => 'DefaultJob';
  }

  if $bacula::jobdefs != [] {
    realize(Bacula::Jobdefs[$bacula::jobdefs])
  }
}
