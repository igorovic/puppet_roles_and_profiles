class profile::nodejs {
    # REQUIREMENTS
    # puppet module puppet-nodejs
    #   install #> puppet module install puppet-nodejs -i "$(puppet config print environmentpath)/$(puppet config print environment)/modules"
    class { 'nodejs': }
}