class bacula::default::filesets inherits ::bacula::params {

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

  @bacula::fileset{'Jenkins':
    name    => 'Jenkins',
    include => '/var/lib/jenkins',
  }

  if $filesets != [] {
    realize(Bacula::Fileset[$filesets])
  }

}
