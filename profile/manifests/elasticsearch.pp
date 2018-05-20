class profile::elasticsearch{
    # REQUIREMENTS
    # puppet module elastic-elasticsearch
    # puppet module puppetlabs-java
    include ::java

    class { 'elasticsearch': }
    elasticsearch::instance { 'es-01':
      status => 'running',
    }
}