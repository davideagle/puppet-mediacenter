class mediacenter::transmission::setup {

  class { 'transmission':
    rpc_username => 'rpcuser',
    rpc_password => '',
    rpc_port     => 9091,
    peer_port    => 54612,
    encryption   => 2
  }

  include ::docker

  docker::image { 'linuxserver/transmission':
    ensure    => 'present',
    image_tag => 'latest'
  }

  docker::run { 'transmission':
    image   => 'linuxserver/transmission:latest',
    expose  => ['8989'],
    volumes => [
                '/etc/localtime:/etc/localtime:ro',
                '/opt/sonarr/config:/config',
                '/opt/sonarr/downloads:/downloads',
                '/opt/sonarr/downloads/tv:/tv',
                ],

  }
  # docker create --name=transmission \
  # -v <path to data>:/config \
  # -v <path to downloads>:/downloads \
  # -v <path to watch folder>:/watch \
  # -e PGID=<gid> -e PUID=<uid> \
  # -e TZ=<timezone> \
  # -p 9091:9091 -p 51413:51413 \
  # -p 51413:51413/udp \
  # linuxserver/transmission
}
