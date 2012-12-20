class bacula::director::collect {

  Bacula::Client  <<| $::bacula::params::client_collect_filter  |>> { notify => Service[$director_service_name] }
  Bacula::Fileset <<| $::bacula::params::fileset_collect_filter |>> { notify => Service[$director_service_name] }
  Bacula::Job     <<| $::bacula::params::job_collect_filter     |>> { notify => Service[$director_service_name] }
  Bacula::Pool    <<| $::bacula::params::pool_collect_filter    |>> { notify => Service[$director_service_name] }

}
