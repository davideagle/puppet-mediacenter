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
    env     => ['PGID=0', 'PUID=0']

  }

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
