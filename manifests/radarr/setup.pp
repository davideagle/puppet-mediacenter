class mediacenter::radarr::setup(
  String                $log_level                 = 'Info',
  Integer               $port                      = 7878,
  String                $url_base                  = '',
  String                $bind_address              = '*',
  Integer               $ssl_port                  = 9898,
  Boolean               $enable_ssl                = false,
  String                $api_key                   = '746d1069cd3d4358bd3a1c97145535bd',
  String                $authentication_method     = 'None',
  String                $branch                    = 'Develop',
  Boolean               $launch_browser            = true,
  String                $ssl_cert_hash             = '',
  String                $update_mechanism          = 'BuiltIn'
  ) {

  include ::docker

  docker::image { 'linuxserver/radarr':
    ensure    => 'present',
    image_tag => 'latest'
  }

  docker::run { 'radarr':
    image   => 'linuxserver/radarr:latest',
    expose  => ['7878'],
    ports   => ['7878:7878'],
    volumes => [
                '/etc/localtime:/etc/localtime:ro',
                '/opt/radarr/config:/config',
                '/opt/transmission/downloads:/downloads',
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
  }

  file { '/opt/radarr/config/config.xml':
    ensure  => file,
    mode    => '0644',
    content => template("${module_name}/radarr/config.xml.erb"),
    require => File['/opt/radarr/config'],
    notify  => Docker::Run['radarr']
  }

}
