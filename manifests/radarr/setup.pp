class mediacenter::radarr::setup {

  include ::docker

  docker::image { 'linuxserver/radarr':
    ensure    => 'present',
    image_tag => 'latest'
  }

  docker::run { 'radarr':
    image   => 'linuxserver/radarr:latest',
    expose  => ['8989'],
    ports   => ['8989:8989'],
    volumes => [
                '/etc/localtime:/etc/localtime:ro',
                '/opt/radarr/config:/config',
                '/opt/radarr/downloads:/downloads',
                '/media/movies:/movies',
                ],
    env     => ['PGID=1001', 'PUID=1001']

  }


  # docker create \
  #   --name radarr \
  #   -p 8989:8989 \
  #   -e PUID=<UID> -e PGID=<GID> \
  #   -e TZ=<timezone> \
  #   -v /etc/localtime:/etc/localtime:ro \
  #   -v </path/to/appdata>:/config \
  #   -v <path/to/tvseries>:/tv \
  #   -v <path/to/downloadclient-downloads>:/downloads \
  #   linuxserver/radarr


  file { '/opt/radarr':
    ensure => directory,
    mode   => '0644'
  } ->
  file { '/opt/radarr/config':
    ensure => directory,
    mode   => '0644'
  } ->
  file { '/opt/radarr/downloads':
    ensure => directory,
    mode   => '0644'
  }

}
