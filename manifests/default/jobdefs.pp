class bacula::default::jobdefs inherits ::bacula::params {

  @bacula::jobdefs{'DefaultJob':
    name => 'DefaultJob',
  }

  @bacula::jobdefs{'Mysql':
    name    => 'Mysql',
    fileset => 'MysqlData',
  }

  @bacula::jobdefs{'Config':
    name    => 'Config',
    fileset => 'Config',
  }

  if $jobdefs != [] {
    realize(Bacula::Jobdefs[$jobdefs])
  }

}
