# == Class: mediacenter::jacket::setup
#
class mediacenter::jacket::setup {
  include ::docker

  docker::image { 'linuxserver/jackett':
    ensure    => 'present',
    image_tag => 'latest'
  }

  docker::run { 'jackett':
    image  => 'linuxserver/jackett:latest',
    expose => ['9117'],
    ports  => ['9117:9117'],
    volumes => [
                '/etc/localtime:/etc/localtime:ro',
                '/opt/jackett/downloads:/config',
                '/opt/jackett/config:/downloads'
                ],
    env     => ['PGID=1001', 'PUID=1001']
  }

  file { '/opt/jackett':
    ensure => directory,
    mode => '0644',
  }->

  file { '/opt/jackett/downloads':
    ensure => file,
    mode => '0644',
  }->

  file { '/opt/jackett/config':
    ensure => file,
    mode => '0644',
  }



}
