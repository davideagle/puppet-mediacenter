# == Class: mediacenter::jacket::setup
#
class mediacenter::jacket::setup {
  include ::docker

  docker::image { 'ubuntu':
    ensure    => 'present',
    image_tag => 'linuxserver/jackett'
  }

  docker::run { 'jackett':
    image  => 'linuxserver/jackett',
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


  vcsrepo { '/opt/jacket':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/Jackett/Jackett.git',
  }



}
