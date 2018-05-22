class role::elasticsearch {
    include profile::base
    include profile::elasticsearch
    include profile::nodejs
}