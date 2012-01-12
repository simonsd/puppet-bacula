class bacula::filesets {
  file {
    '/etc/bacula/filesets.d':
      ensure => 'directory',
      owner  => 'root',
      group  => 'root',
      mode   => '0640';
  }

  @bacula::fileset {
    'Catalog':
      name    => 'Catalog',
      include => '/var/spool/bacula/bacula.sql';

    'FullSet':
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
      ];

    'MysqlData':
      name    => 'MysqlData',
      include => '/var/lib/mysql';

    'Config':
      name    => 'Config',
      include => '/etc';
  }

  if "${bacula::filesets}" != [] {
    realize(Bacula::Fileset[$bacula::filesets])
  }
}
