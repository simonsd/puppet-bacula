class bacula::filesets {
  file {
    '/etc/bacula/filesets.d':
      ensure => directory,
      owner => root,
      group => root,
      mode => 0640;
  }

  @bacula::fileset {
    'Catalog':
      name => 'Catalog',
      include => '/var/spool/bacula/bacula.sql';

    'FullSet':
      name => 'FullSet',
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
  }

  if "${bacula::filesets}" != [] {
    realize(Bacula::Fileset[$bacula::filesets])
  }
}
