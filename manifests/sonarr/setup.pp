class mediacenter::sonarr::setup(
  Integer                $port                  = 8989,
  Integer                $ssl_port              = 9898,
  Boolean                $enable_ssl            = false,
  String                 $api_key               = '704a2318431f49f99b76a6b260d554ca',
  String                 $authentication_method = 'None',
  String                 $branch                = 'master',
  String                 $launch_browser        = true,
  String                 $update_mechanism      = 'BuiltIn',

) {

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
                '/opt/transmission/downloads:/downloads',
                '/media/tv:/tv',
                ],
    env     => ['PGID=0', 'PUID=0']

  }

  file { '/opt/sonarr':
    ensure => directory,
    mode   => '0644'
  } ->
  file { '/opt/sonarr/config':
    ensure => directory,
    mode   => '0644'
  }

  file { '/opt/sonarr/config/config.xml':
    ensure  => file,
    mode    => '0600',
    content => template("${module_name}/transmission/config.xml.erb"),
    require => File['/opt/sonarr/config'],
  }

}
