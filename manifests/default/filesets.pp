class bacula::default::filesets {

  @bacula::fileset{'Catalog':
     name    => 'Catalog',
     include => "${::bacula::working_dir}/bacula.sql",
  }

  @bacula::fileset{'FullSet':
    name    => 'FullSet',
    include => [
      '/',
      '/boot',
      '/home',
      '/opt',
      '/usr',
      '/var',
      '/var/log'
    ],
    exclude => [
      '/proc',
      '/tmp',
      '/.journal',
      '/.fsck'
    ],
  }

  @bacula::fileset{'MysqlData':
    name    => 'MysqlData',
    include => '/var/lib/mysql',
  }

  @bacula::fileset{'Config':
    name    => 'Config',
    include => '/etc',
  }

  if $::bacula::filesets != [] {
    realize(Bacula::Fileset[$::bacula::filesets])
  }

}
