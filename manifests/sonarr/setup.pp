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

  user { 'sonarr':
    comment => 'sonarr',
    home    => '/home/sonarr',
    ensure  => present,
    before  => File['/home/sonarr']
  }

  file { '/home/sonarr':
    ensure => directory,
    mode   => '0600',
    owner  => 'sonarr'
  }

}
