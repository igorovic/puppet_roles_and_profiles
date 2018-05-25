class profile::elasticsearch{
    # REQUIREMENTS
    # puppet module elastic-elasticsearch
    #   install #> puppet module install elastic-elasticsearch -i "$(puppet config print environmentpath)/$(puppet config print environment)/modules"
    # puppet module puppetlabs-java
    #   install #> puppet module install puppetlabs-java -i "$(puppet config print environmentpath)/$(puppet config print environment)/modules"
    include ::java

    class { 'elasticsearch':
      api_host                => "$::ipaddress",
    }
    elasticsearch::instance { 'es-01':
      status => 'running',
      config => { 'network.host' => '0.0.0.0' }, # not good for production 
    }
}