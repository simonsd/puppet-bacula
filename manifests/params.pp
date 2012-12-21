class bacula::params {

  ######################
  ####    Common    ####
  ######################

  $config_root = '/etc/bacula'
  $working_dir = $::osfamily ? {
    /(?i:redhat)/ => '/var/spool/bacula',
    /(?i:debian)/ => '/var/lib/bacula',
  }
  $pid_dir     = '/var/run/bacula'
  $log_dir     = '/var/log/bacula'

  ########################
  ####    Database    ####
  ########################

  $dbname     = 'bacula'
  $dbuser     = 'bacula'
  $dbpassword = 'bacula'
  $dbhost     = 'localhost'

  ########################
  ####    Director    ####
  ########################

  $admin_email                = undef
  $operator_email             = undef
  $director_server            = 'bacula'
  $director_label             = 'bacula-dir'
  $director_password          = 'bacula'
  $director_port              = '9101'
  $director_pkgname           = 'bacula-director-mysql'
  $director_service_name      = $::operatingsystem ? {
    centos => 'bacula-dir',
    debian => 'bacula-director',
  }
  $director_service_hasstatus = $::operatingsystem ? {
    default => undef,
    debian  => false,
  }
  $director_service_ensure    = 'running'
  $director_service_enable    = true
  $db_init_command            = $::operatingsystem ? {
    centos => '/usr/libexec/bacula/make_bacula_tables',
    debian => '/usr/share/bacula-director/make_mysql_tables',
  }

  $schedules  = [
    'FullDaily',
    'FullWeekly',
    'IncDaily',
    'IncWeekly',
    'DiffDaily',
    'DiffWeekly',
    'FullMonthlyDiffWeeklyIncDaily',
    'FullWeeklyDiffDailyIncHourly',
    'FullWeeklyIncDaily',
  ]

  $filesets   = [
    'Catalog',
    'FullSet',
    'MysqlData',
    'Config',
  ]

  $jobdefs    = [
    'DefaultJob',
    'Mysql',
    'Config',
  ]

  #######################
  ####    Storage    ####
  #######################

  $sd_port              = '9103'
  $storage_dir          = '/mnt/backup'
  $sd_pkgname           = $::operatingsystem ? {
    default => 'bacula-storage-mysql',
    debian  => 'bacula-sd-mysql',
  }
  $sd_service_name      = 'bacula-sd'
  $sd_service_ensure    = 'running'
  $sd_service_enable    = true
  $sd_service_hasstatus = $::operatingsystem ? {
    default => undef,
    debian  => false,
  }

  $sd_server            = "bacula.${::domain}"
  $sd_label             = 'bacula-sd'
  $sd_password          = 'bacula'
  $sd_owner             = 'bacula'
  $sd_group             = 'bacula'

  ###########################
  ####    File Daemon    ####
  ###########################

  $fd_port                = '9102'
  $fd_max_concurrent_jobs = '1'
  $fd_pkgname             = 'bacula-client'
  $fd_service_name        = 'bacula-fd'
  $fd_service_ensure      = 'running'
  $fd_service_enable      = true
  $fd_service_hasstatus   = true

  ########################
  ####    Bconsole    ####
  ########################

  $bconsole_pkgname = 'bacula-console'

}
