class mediacenter::system::services {
  service { 'kodi':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    provider   => 'systemd',
  }

  file{ '/usr/lib/systemd/system/kodi.service':
    source => "puppet:///modules/${module_name}/docker/config.json"
  }
}
