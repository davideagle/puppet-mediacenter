class mediacenter::sonarr::setup {

  user { 'sonarr':
    comment => 'sonarr',
    home    => '/home/sonarr',
    ensure  => present,
    before  => File['/home/sonarr']
  }

  file { '/home/sonarr':
    ensure => directory,
    mode   => '0600',
    owner  => 'sonarr'
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

  package { 'libmono-cil-dev':
    ensure => installed,
  }

}
