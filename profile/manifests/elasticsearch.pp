class profile::elasticsearch{
    apt::key { 'elasticsearch':
      id     => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
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