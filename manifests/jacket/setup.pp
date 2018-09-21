# == Class: mediacenter::jacket::setup
#
class mediacenter::jacket::setup(
  Integer                $port                 = 9117,
  Boolean                $allow_external       = true,
  String                 $api_key              = 'wapifjmpzaww0l7hyn0f891bkuvri2in',
  String                 $admin_password       = 'null',
  String                 $blackhole_dir        = '',
  Boolean                $update_disabled      = false,
  Boolean                $update_prerelease    = false,
  String                 $base_path_override   = '',
  String                 $omdb_api_key         = '421fe225',
  String                 $omdb_api_url         = '',
  String                 $proxy_url            = '',
  Integer                $proxy_type           = 0,
  Integer                $proxy_port           = Null,
  String                 $proxy_username       = '',
  String                 $proxy_password       = '',
  Boolean                $proxy_is_anonymous   = true,
  ) {
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

  file { '/opt/jackett':
    ensure => directory,
    mode   => '0644',
  }->

  file { '/opt/jackett/downloads':
    ensure => directory,
    mode   => '0644',
  }->

  file { '/opt/jackett/config':
    ensure => directory,
    mode   => '0644',
  }->

  file { '/opt/jackett/config/Jackett':
    ensure => directory,
    mode   => '0644',
  }

  file { '/opt/jackett/config/Jackett/ServerConfig.json':
    ensure  => file,
    mode    => '0644',
    content => template("${module_name}/jackett/ServerConfig.json.erb"),
    require => File['/opt/jackett/config/Jackett'],
  }

  file { '/opt/jackett/config/Jackett/Indexers':
    ensure  => directory,
    mode    => '0644',
    recurse => true,
    source  => "puppet:///modules/${module_name}/Jackett/config/Jackett/Indexers",
  }



}
