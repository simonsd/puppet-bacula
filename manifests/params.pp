class bacula::params {

  $config_root = '/etc/bacula'
  $working_dir = $::osfamily ? {
    /(?i:redhat)/ => '/var/spool/bacula',
    /(?i:debian)/ => '/var/lib/bacula',
  }
  $pid_dir     = '/var/run/bacula'

  ########################
  ####    Defaults    ####
  ########################

  $default_storage_server   = "bacula.${::domain}"
  $default_storage_label    = 'bacula-sd'
  $default_storage_password = 'bacula'
  $default_storage_path     = '/mnt/backup'
  $default_storage_owner    = 'bacula'
  $default_storage_group    = 'bacula'
  $default_log_output       = 'Default'

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

  $admin_email       = undef
  $operator_email    = undef
  $director_server   = 'bacula'
  $director_label    = 'bacula-dir'
  $director_password = 'bacula'

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

  $storage_dir     = '/mnt/backup'
  $storage_pkgname = $::operatingsystem ? {
    default => 'bacula-storage-mysql',
    debian  => 'bacula-sd-mysql',
  }

  ###########################
  ####    File Daemon    ####
  ###########################

  $fd_port                = '9102'
  $fd_max_concurrent_jobs = '1'
  $fd_pkgname             = 'bacula-client'

}
