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
                '/opt/jackett/config:/config',
                '/opt/jackett/downloads:/downloads'
                ],
    env     => ['PGID=0', 'PUID=0']
  }

  # docker create \
  # --name=jackett \
  # -v <path to data>:/config \
  # -v <path to blackhole>:/downloads \
  # -e PGID=<gid> -e PUID=<uid> \
  # -e TZ=<timezone> \
  # -v /etc/localtime:/etc/localtime:ro \
  # -p 9117:9117 \
  # linuxserver/jackett

  file { '/opt/jackett':
    ensure => directory,
    mode => '0644',
  }->

  file { '/opt/jackett/downloads':
    ensure => directory,
    mode => '0644',
  }->

  file { '/opt/jackett/config':
    ensure => directory,
    mode => '0644',
  }->

  file { '/opt/jackett/config/Jackett':
    ensure => directory,
    mode => '0644',
  }->

  file { '/opt/jackett/config/Jackett/ServerConfig.json':
    ensure => file,
    mode => '0644',
    content => template('jackett/ServerConfig.json.erb')
  }



}
