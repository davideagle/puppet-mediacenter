class mediacenter::kodi::setup {
  class { "kodi" : }

  user { 'kodi':
    comment => 'First Last',
    home    => '/var/lib/kodi',
    ensure  => present,
    uid     => '420',
    groups  => ['audio','video']
    shell   => '/usr/bin/nologin kodi'
  }

}
