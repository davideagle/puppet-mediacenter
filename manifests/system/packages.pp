class mediacenter::system::packages {
  package { 'cinnamon-desktop-environment':
    ensure => installed,
  }
  package { 'lightdm':
    ensure => installed,
  }
}
