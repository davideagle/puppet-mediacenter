class mediacenter::sonarr::setup {

  user { 'sonarr':
    comment => 'sonarr',
    home => '/home/sonarr',
    ensure => present,
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
  #sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xFDA5DFFC
  #sudo echo "deb http://apt.sonarr.tv/ master main" | sudo tee /etc/apt/sources.list.d/sonarr.list
  apt::source { 'sonarr-test':
   location => 'http://apt.sonarr.tv/',
   release  => '',
   repos    => 'main',
   key      => {
     'id'     => 'FDA5DFFC',
     'server' => 'keyserver.ubuntu.com',
   },
 }

}
