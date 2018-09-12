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
                '/opt/sonarr/downloads:/downloads',
                '/opt/sonarr/downloads/tv:/tv',
                ],
    env     => ['PGID=1001', 'PUID=1001']

  }


  # docker create \
  #   --name sonarr \
  #   -p 8989:8989 \
  #   -e PUID=<UID> -e PGID=<GID> \
  #   -e TZ=<timezone> \
  #   -v /etc/localtime:/etc/localtime:ro \
  #   -v </path/to/appdata>:/config \
  #   -v <path/to/tvseries>:/tv \
  #   -v <path/to/downloadclient-downloads>:/downloads \
  #   linuxserver/sonarr


  file { '/opt/sonarr':
    ensure => directory,
    mode   => '0644'
  } ->
  file { '/opt/sonarr/config':
    ensure => directory,
    mode   => '0644'
  } ->
  file { '/opt/sonarr/downloads':
    ensure => directory,
    mode   => '0644'
  } ->
  file { '/opt/sonarr/tv':
    ensure => directory,
    mode   => '0644'
  }

}
