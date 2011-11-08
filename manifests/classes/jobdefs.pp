class bacula::jobdefs {
  file {
    '/etc/bacula/jobdefs.d':
      ensure => directory,
      owner => root,
      group => root,
      mode => '0640';
  }

  @bacula::jobdefs {
    'DefaultJob':
      name => 'DefaultJob';
  }

  if $bacula::jobdefs != [] {
    realize(Bacula::Jobdefs[$bacula::jobdefs])
  }
}
