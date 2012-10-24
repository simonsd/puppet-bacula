class bacula::fd::install {

  package{'bacula-client':
    ensure => latest,
  }

}
