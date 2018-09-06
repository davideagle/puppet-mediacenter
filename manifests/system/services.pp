class mediacenter::system::services {
  service { 'kodi':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    provider   => 'systemd',
  }
}
