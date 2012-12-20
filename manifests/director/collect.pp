class bacula::director::collect {

  Bacula::Client  <<| $client_collect_filter  |>> { notify => Service[$director_service_name] }
  Bacula::Fileset <<| $fileset_collect_filter |>> { notify => Service[$director_service_name] }
  Bacula::Job     <<| $job_collect_filter     |>> { notify => Service[$director_service_name] }
  Bacula::Pool    <<| $pool_collect_filter    |>> { notify => Service[$director_service_name] }

}
