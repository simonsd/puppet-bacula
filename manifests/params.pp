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

  $dbuser     = 'bacula'
  $dbpassword = 'bacula'
  $dbhost     = 'localhost'

  ########################
  ####    Director    ####
  ########################

  $log_email                  = undef
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
  $dir_max_concurrent_jobs    = '1'

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

  $catalog_collect_filter  = ''
  $client_collect_filter   = ''
  $fileset_collect_filter  = ''
  $job_collect_filter      = ''
  $jobdef_collect_filter   = ''
  $pool_collect_filter     = ''
  $schedule_collect_filter = ''
  $storage_collect_filter  = ''

  #######################
  ####    Storage    ####
  #######################

  $sd_port                = '9103'
  $storage_dir            = '/mnt/backup'
  $sd_pkgname             = $::operatingsystem ? {
    default => 'bacula-storage-mysql',
    debian  => 'bacula-sd-mysql',
  }
  $sd_service_name        = 'bacula-sd'
  $sd_service_ensure      = 'running'
  $sd_service_enable      = true
  $sd_service_hasstatus   = $::operatingsystem ? {
    default => undef,
    debian  => false,
  }

  $sd_server              = "bacula.${::domain}"
  $sd_label               = 'bacula-sd'
  $sd_password            = 'bacula'
  $sd_owner               = 'bacula'
  $sd_group               = 'bacula'
  $sd_max_concurrent_jobs = '1'

  $media_type             = 'File'

  ###########################
  ####    File Daemon    ####
  ###########################

  $fd_port                = '9102'
  $fd_password            = 'bacula'
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

  ######################
  ####    Client    ####
  ######################

  $catalog = 'DefaultCatalog'

}
