class bacula::fd::install {

  package{$fd_pkgname:
    ensure => 'present',
  }

}
