class mediacenter::muximux::setup {

  include ::docker

  docker::image { 'linuxserver/muximux':
    ensure    => 'present',
    image_tag => 'latest'
  }

  docker::run { 'muximux':
    image   => 'linuxserver/muximux:latest',
    expose  => ['80'],
    ports   => ['80:80'],
    volumes => [
                '/etc/localtime:/etc/localtime:ro',
                '/opt/muximux/config:/config'
                ],
    env     => ['PGID=1000', 'PUID=1000']

  }

  file { '/opt/muximux':
    ensure => directory,
    mode   => '0644'
  } ->
  file { '/opt/muximux/config':
    ensure => directory,
    mode   => '0644'
  }

}
