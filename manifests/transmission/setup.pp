class mediacenter::transmission::setup {

  include ::docker

  docker::image { 'linuxserver/transmission':
    ensure    => 'present',
    image_tag => 'latest'
  }

  docker::run { 'transmission':
    image   => 'linuxserver/transmission:latest',
    expose  => ['9091','51413'],
    ports   => ['9091:9091','51413:51413','51413:51413/udp'],
    env     => ['PGID=1001', 'PUID=1001'],
    volumes => [
                '/etc/localtime:/etc/localtime:ro',
                '/opt/transmission/config:/config',
                '/opt/transmission/downloads:/downloads',
                '/opt/transmission/downloads/watch:/watch',
                ],

  }

  file { '/opt/transmission':
    ensure => directory,
    mode => '0644',
  } ->
  file { '/opt/transmission/config':
    ensure => directory,
    mode => '0644',
  } ->
  file { '/opt/transmission/downloads':
    ensure => directory,
    mode => '0644',
  } ->
  file { '/opt/transmission/watch':
    ensure => directory,
    mode => '0644',
  }

  file { '/opt/transmission/config/settings.json.puppet':
    ensure  => file,
    mode    => '0600',
    content => template('transmission/settings.json.erb'),
    require => File['/opt/transmission/config'],
  }

}
