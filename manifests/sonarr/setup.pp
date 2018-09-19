class mediacenter::sonarr::setup {

  include ::docker

  docker::image { 'linuxserver/sonarr':
    ensure    => 'present',
    image_tag => 'latest'
  }

  docker::run { 'sonarr':
    image   => 'linuxserver/sonarr:latest',
    expose  => ['8989'],
    ports   => ['8989:8989'],
    volumes => [
                '/etc/localtime:/etc/localtime:ro',
                '/opt/sonarr/config:/config',
                '/opt/transmission/downloads:/downloads',
                '/media/tv:/tv',
                ],
    env     => ['PGID=0', 'PUID=0']

  }

  file { '/opt/sonarr':
    ensure => directory,
    mode   => '0644'
  } ->
  file { '/opt/sonarr/config':
    ensure => directory,
    mode   => '0644'
  }

}
