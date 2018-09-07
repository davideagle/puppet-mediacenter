class mediacenter::system::packages {
  package { 'xauth':
    ensure => installed,
  }
  package { 'xorg':
    ensure => installed,
  }
  package { 'xinit':
    ensure => installed,
  }
  package { 'xserver-xorg-core':
    ensure => installed,
  }
  package { 'xserver-xorg':
    ensure => installed,
  }
  package { 'xserver-common':
    ensure => installed,
  }
