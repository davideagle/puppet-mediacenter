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
}
