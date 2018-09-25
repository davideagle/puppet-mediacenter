class mediacenter::muximux::setup inherits mediacenter::params {

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

  file { '/opt/muximux/config/www/muximux/settings.ini.php':
    ensure  => file,
    mode    => '0644',
    content => template("${module_name}/muximux/settings.ini.php.erb"),
    require => File['/opt/muximux/config'],
  }

}
