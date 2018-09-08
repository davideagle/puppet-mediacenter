class mediacenter::sickbeard::setup {

  user { 'sickbeard':
    comment => 'sickbeard',
    home    => '/home/sickbeard/',
    ensure  => present,
    before  => Class['sickbeard']
  }

  class { 'sickbeard': }
}
