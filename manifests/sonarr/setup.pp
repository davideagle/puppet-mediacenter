class mediacenter::sonarr::setup {

  docker::image { 'linuxserver/sonarr':
    ensure    => 'present',
    image_tag => 'latest'
  }

  docker::run { 'sonarr':
    image   => 'linuxserver/sonarr:latest',
    expose  => ['8989'],
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

  class { 'sonarr':
    package_ensure => present,
    service_name   => 'sonarr',
    service_enable => true,
    service_ensure => running,
    service_manage => true,
    user           => 'sonarr',
    group          => 'sonarr'
  }

  package { 'libmono-cil-dev':
    ensure => installed,
  }

  package { 'mono-devel':
    ensure => installed,
  }

  include ::apt
  apt::source { 'mono-official':
    location => 'https://download.mono-project.com/repo/ubuntu',
    repos    => 'main',
    key      => {
      'id'     => '3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF',
      'server' => 'keyserver.ubuntu.com',
    },
    before   => Package['mono-devel'],
  }

}
