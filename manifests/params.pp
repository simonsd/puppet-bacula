class bacula::params {

  $director    = false
  $storage     = false
  $client      = true

  $config_root = '/etc/bacula'
  $working_dir = $::osfamily ? {
    /(?i:redhat)/ => '/var/spool/bacula',
    /(?i:debian)/ => '/var/lib/bacula',
  }

  ########################
  ####    Defaults    ####
  ########################

  $default_storage_server   = 'bacula'
  $default_storage_label    = 'bacula-sd'
  $default_storage_password = 'bacula'
  $default_storage_owner    = 'bacula'
  $default_storage_group    = 'bacula'

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

  $storage_dir = '/mnt/backup'

}
