import 'classes/*'
import 'definitions/*'

class bacula (
  $admin_email,
  $operator_email,
  $director_server = 'bacula',
  $director_label = 'bacula-dir',
  $director_password = 'bacula',
  $default_storage_server = 'bacula',
  $default_storage_label = 'bacula-sd',
  $default_storage_password = 'bacula',
  $storage_dir = '/mnt/backup',
  $dbname = 'bacula',
  $dbuser = 'bacula',
  $dbpassword = 'bacula',
  $dbhost = 'localhost',
  $bweb_user = 'bacula',
  $bweb_passwd = 'bacula',
  $director = 'no',
  $storage = 'no',
  $client = 'yes',
  $schedules = ['FullDaily', 'FullWeekly', 'IncDaily', 'IncWeekly', 'DiffDaily', 'DiffWeekly', 'FullMonthlyDiffWeeklyIncDaily', 'FullWeeklyDiffDailyIncHourly', 'FullWeeklyIncDaily'],
  $filesets = ['Catalog', 'FullSet', 'MysqlData', 'Config'],
  $jobdefs = ['DefaultJob', 'Mysql', 'Config']
) {
  include iptables

  if $director == 'yes' {
    include bacula::director
    include bacula::filesets
    include bacula::schedules
    include bacula::clients
    include bacula::jobdefs
  }

  if $storage == 'yes' {
    include bacula::storage
    include bacula::devices
  }

  if $client == 'yes' {
    include bacula::fd
  }

  include bacula::console
}
