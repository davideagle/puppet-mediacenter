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

  include ::apt
  apt::source { 'mono-official':
    location => 'https://download.mono-project.com/repo/ubuntu',
    repos    => 'main',
    key      => {
      'id'     => '3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF',
      'server' => 'keyserver.ubuntu.com',
    },
  }
}
