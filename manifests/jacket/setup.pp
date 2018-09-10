# == Class: mediacenter::jacket::setup
#
class mediacenter::jacket::setup {
  vcsrepo { '/opt/jacket':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/Jackett/Jackett.git',
  }

  package { 'nuget':
    ensure => installed,
  }
  package { 'libmono-addins-msbuild-cil-dev':
    ensure => installed,
  }
}
