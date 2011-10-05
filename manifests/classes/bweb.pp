# /etc/puppet/modules/bacula/manifests/init.pp

class bacula::bweb {
  include bacula::config

  include apache
  include repo::epel
  include repo::rpmforge
  include devel::make

  file {
    "/usr/tar":
      ensure  => directory,
      owner   => "root",
      group   => "root",
      mode    => 700;

    "/usr/src/bacula-gui-5.0.2/bweb/install_bweb":
      owner   => "git",
      group   => "git",
      mode    => 755,
      source  => 'puppet:///modules/bacula/install_bweb',
      require => Package[make,httpd,perl-GD-Graph3d,perl-HTML-Template,perl-Expect,perl-Time-modules,perl-Date-Calc,perl-Test-Base,perl-CGI];

    "/etc/bacula/bweb.conf":
      owner   => "root",
      group   => "root",
      mode    => 644,
      content => template("bacula/bweb.conf.erb"),
      require => Exec['bweb-inst'];

    "/etc/httpd/conf.d/bweb.conf":
      owner   => "apache",
      group   => "root",
      mode    => 644,
      source  => 'puppet:///modules/bacula/httpd.conf',
      require => Exec['bweb-inst'];
  }

  exec {
    "bweb-tar":
      command => '/usr/bin/wget http://sourceforge.net/projects/bacula/files/bacula/5.0.2/bacula-gui-5.0.2.tar.gz/download',
      creates => '/usr/tar/bacula-gui-5.0.2.tar.gz',
      cwd     => '/usr/tar',
      require => File["/usr/tar"];

    "bweb-src":
      command   => '/bin/tar zxvf /usr/tar/bacula-gui-5.0.2.tar.gz',
      creates   => '/usr/src/bacula-gui-5.0.2',
      cwd       => '/usr/src',
      require   => Exec["bweb-tar"];

    "bweb-mysql":
      command   => "/usr/bin/mysql $bacula::config::dbname < /usr/src/bacula-gui-5.0.2/bweb/script/bweb-mysql.sql",
      subscribe => Exec["bweb-src"],
      require   => [ Exec["bweb-tar"], Class["mysql::server::service"] ],
      unless    => "/usr/bin/mysqlshow $bacula::config::dbname | grep bweb_user",
      before    => Exec["bacula-db-tables"];

    "bweb-inst":
      command   => '/usr/src/bacula-gui-5.0.2/bweb/install_bweb',
      creates   => '/var/www/html/bweb',
      cwd       => '/usr/src/bacula-gui-5.0.2/bweb',
      subscribe => File["/usr/src/bacula-gui-5.0.2/bweb/install_bweb"];

    "bweb_htpasswd":
      unless  => "/bin/grep $bacula::config::bweb_user /etc/bacula/htpasswd.users",
      command => "/usr/bin/htpasswd -bc /etc/bacula/htpasswd.users $bacula::config::bweb_user $bacula::config::bweb_passwd",
      require => Class["apache::install"],
      notify  => Class["apache::service"];
  }

  package { 
    perl-GD-Graph3d:
      ensure  => latest,
      require => Exec["epel_repo_rpm", "rpmforge_repo_rpm"];
    perl-HTML-Template:
      ensure  => latest;
    perl-Expect:
      ensure  => latest;
    perl-Time-modules:
      ensure  => latest;
    perl-Test-Base:
      ensure  => latest;
    perl-Date-Calc:
      ensure  => latest;
    perl-CGI:
      ensure  => latest;
  }
}
