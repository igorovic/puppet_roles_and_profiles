class profile::elasticsearch{
    include ::apt
    
    apt::key { 'elasticsearch':
      id     => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
      server => 'artifacts.elastic.co',
      source => 'https://artifacts.elastic.co/GPG-KEY-elasticsearch',
    }->
      exec { "add-elasticsearch-repo":
      command => '/bin/echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list',
      onlyif  => "/usr/bin/test ! -f /etc/apt/sources.list.d/elastic-6.x.list",
      notify => Exec['apt_update'],
    }->
    class { 'java':
      distribution => 'jre',
    }->
    package{'apt-transport-https': ensure => 'installed'}->
    package{'elasticsearch': ensure => 'installed'}
}