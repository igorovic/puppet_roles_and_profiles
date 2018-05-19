class profile::elasticsearch{
    apt::key { 'elasticsearch':
      id     => '4609 5ACC 8548 582C 1A26 99A9 D27D 666C D88E 42B4'
      server => 'artifacts.elastic.co',
      source => 'https://artifacts.elastic.co/GPG-KEY-elasticsearch',
      notify => Exec['apt_update'],
    }
    class { 'java':
      distribution => 'jre',
    }->
    package{'apt-transport-https': ensure => 'installed'}->
    package{'elasticsearch': ensure => 'installed'}
}