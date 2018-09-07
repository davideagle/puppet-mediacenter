class mediacenter::kodi::setup {
  class { "kodi" : }

  file { '/var/lib/kodi':
    ensure => directory,
    mode => '0644',
    owner => 'kodi',
    group => 'kodi',
    before => File['/var/lib/kodi/.kodi']
  }

  file { '/var/lib/kodi/.kodi':
    ensure => directory,
    mode => '0644',
    owner => 'kodi',
    group => 'kodi',
  }

  file { '/root/.config/autostart':
    ensure => 'link',
    target => '/usr/bin/kodi',
  }

  user { 'kodi':
    comment => 'First Last',
    home    => '/var/lib/kodi',
    ensure  => present,
    uid     => '420',
    groups  => ['audio','video'],
    shell   => '/usr/sbin/nologin'
  }

  exec { 'kodi-pass':
    command => 'passwd -l kodi > /dev/null'
  }

}
