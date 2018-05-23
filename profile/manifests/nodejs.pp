class profile::nodejs {
    # REQUIREMENTS
    # puppet module willdurand-nodejs
    #   install #> puppet module install willdurand-nodejs -i "$(puppet config print environmentpath)/$(puppet config print environment)/modules"
    class { 'nodejs': }
}