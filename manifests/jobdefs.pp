class bacula::jobdefs {

  @bacula::jobdef{'DefaultJob':
    name => 'DefaultJob',
  }

  @bacula::jobdef{'Mysql':
    name    => 'Mysql',
    fileset => 'MysqlData',
  }

  @bacula::jobdef{'Config':
    name    => 'Config',
    fileset => 'Config',
  }

  if $bacula::jobdefs != [] {
    realize(Bacula::Jobdef[$bacula::jobdefs])
  }

}
