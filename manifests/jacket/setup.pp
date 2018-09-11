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
    expose => ['9117:9117'],
    volumes => [
                'my-volume:/var/log',
                '/etc/localtime:/etc/localtime:ro',
                '/opt/jackett:/config',
                '/opt/jackett:/downloads'
                ],
  }

  file { '/opt/jackett':
    ensure => directory,
    mode => '0644',
  }



}
