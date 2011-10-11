import 'classes/*'
import 'definitions/*'

class bacula (
	$admin_email,
	$operator_email,
	$director_server = 'bacula',
	$director_label = 'bacula-dir',
	$director_password = 'bacula',
	$storage_password = 'bacula',
	$dbname = 'bacula',
	$dbuser = 'bacula',
	$dbpassword = 'bacula',
	$bweb_user = 'bacula',
	$bweb_passwd = 'bacula',
	$client = 'yes',
	$server = 'no'
) {
	if $server == 'yes' {
		include bacula::director
	}

	if $client == 'yes' {
		include bacula::client
	}

	include bacula::console
}
