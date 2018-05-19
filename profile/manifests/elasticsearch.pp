class profile::elasticsearch{
    apt::key { 'elasticsearch':
      server =>'artifacts.elastic.co',
      source => 'https://artifacts.elastic.co/GPG-KEY-elasticsearch',
      notify => Exec['apt_update'],
    }
    class { 'java':
      distribution => 'jre',
    }->
    package{'apt-transport-https': ensure => 'installed'}->
    package{'elasticsearch': ensure => 'installed'}
}