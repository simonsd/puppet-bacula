class bacula::director::collect {

  Bacula::Client  <<| $::bacula::params::client_collect_filter  |>>
  Bacula::Fileset <<| $::bacula::params::fileset_collect_filter |>>
  Bacula::Pool    <<| $::bacula::params::pool_collect_filter    |>>

}
