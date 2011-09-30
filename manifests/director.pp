# /etc/puppet/modules/bacula/manifests/director.pp

class bacula::director {
  include bacula::config

  include concat::setup
  include mysql::server 
  include bacula::console 

  package { bacula-director-mysql:
    ensure   => latest,
    require  => Package["mysql-server"];
  }

  file {
    "/usr/sbin/bacula-dir.mysql":
      owner => "root",
      group => "root",
      mode  => 755;

    "/root/bin":
      ensure  => directory,
      owner   => "root",
      group   => "root",
      mode    => 700;

    "/root/bin/label_storage.sh":
      owner   => "root",
      group   => "root",
      mode    => 755,
      source  => 'puppet:///modules/bacula/label_storage.sh',
      require => File["/root/bin"];
  }

  concat { "/etc/bacula/bacula-dir.conf":
    owner   => root,
    group   => root,
    mode    => 640,
    require => Package["bacula-director-mysql"],
    notify  => Service["bacula-dir"];
  }

  concat::fragment { "bacula-dir.conf.header":
    target	=> "/etc/bacula/bacula-dir.conf",
    content => template("bacula/bacula-dir.conf.header.erb"),
    order   => 100,
  }

  concat::fragment { "bacula-dir.conf.jobdefs":
    target	=> "/etc/bacula/bacula-dir.conf",
    content => template("bacula/bacula-dir.conf.jobdefs.erb"),
    order   => 150,
  }

  concat::fragment { "bacula-dir.conf.footer":
    target	=> "/etc/bacula/bacula-dir.conf",
    content => template("bacula/bacula-dir.conf.footer.erb"),
    order   => 300,
  }

  concat::fragment { "/etc/sysconfig/iptables.bacula.director":
    target	=> "/etc/sysconfig/iptables",
    source 	=> 'puppet:///modules/bacula/iptables.director',
    order	=> 200,
  }

  mysqldb { "$bacula::config::dbname":
    user      => "$bacula::config::dbname",
    password  => "$bacula::config::dbpassword",
    require   => Class["mysql::server::service"];
  }
	
  exec {
    ## mysql		
    #"/usr/libexec/bacula/create_bacula_database":
    #   subscribe => Package["bacula-director-mysql"],
    #   require   => Service["mysqld"],
    #   unless    => '/usr/bin/mysqlshow | grep bacula',
    #   before    => Exec["/usr/libexec/bacula/grant_bacula_privileges","bweb-mysql"];

    "bacula-db-privileges":
      command   => "/usr/libexec/bacula/grant_bacula_privileges",
      subscribe => Package["bacula-director-mysql"],
      require   => Service["mysqld"],
      unless    => "/usr/bin/mysql -e \"select * from information_schema.user_privileges\" | grep $bacula::config::dbname",
      before    => Mysqldb["$bacula::config::dbname"];

    "bacula-db-tables":
      command     => "/usr/libexec/bacula/make_bacula_tables",
      environment => "db_name=$bacula::config::dbname",
      subscribe   => Package["bacula-director-mysql"],
      require     => Service["mysqld"],
      unless      => "/usr/bin/mysqlshow $bacula::config::dbname | grep Version",
      before      => Service["bacula-dir"];
  }

  service { "bacula-dir":
    ensure  => running,
    enable  => true,
    require => [ Package[bacula-director-mysql], Service['mysqld'] ];
  }

  Baculaclient <<| |>>
}
