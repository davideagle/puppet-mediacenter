class mediacenter::system::services {
  service { 'kodi':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    provider   => 'systemd',
  }

  file{ '/lib/systemd/system/kodi.service':
    source => "puppet:///modules/${module_name}/kodi/service.conf",
    before => Service['kodi']
  }
}
