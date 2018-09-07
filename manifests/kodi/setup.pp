class mediacenter::kodi::setup {
  class { "kodi" : }

  file { '/var/lib/kodi':
    ensure => directory,
    mode => '0644',
    owner => 'kodi',
    group => 'kodi',
    before => File['kodi']
  }

  file { '/var/lib/kodi/.kodi':
    ensure => directory,
    mode => '0644',
    owner => 'kodi',
    group => 'kodi',
    before => User['kodi']
  }

  /var/lib/kodi/.kodi

  user { 'kodi':
    comment => 'First Last',
    home    => '/var/lib/kodi',
    ensure  => present,
    uid     => '420',
    groups  => ['audio','video'],
    shell   => '/usr/bin/nologin'
  }

  exec { 'kodi-pass':
    command => '/bin/bash passwd -l kodi > /dev/null'
  }

}
