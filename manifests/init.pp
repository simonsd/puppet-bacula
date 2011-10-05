import 'classes/*'
import 'definitions/*'

class bacula (
	$admin_email,
	$operator_email,
	$director_server,
	$director_label = 'bacula-dir',
	$director_password = 'bacula',
	$storage_password = 'bacula',
	$dbname = 'bacula',
	$dbuser = 'bacula',
	$dbpassword = 'bacula',
	$bweb_user = 'bacula',
	$bweb_passwd = 'bacula'
) {
  include bacula::director
}
