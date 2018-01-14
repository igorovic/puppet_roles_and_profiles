class profile::python::install (
    $python_version = '3',
){
    package { "python${python_version}":
        ensure => 'installed',
    }
    include git
    ensure_packages(['curl'], {'ensure'=>'present'})
    ensure_resource('profile::python::pipinstallation', "${python_version}")
    package { 'pipenv':
        ensure => 'installed',
        provider => "pip${python_version}",
        require => Profile::Python::Pipinstallation["${python_version}"],
    }->
    if $::kernel == 'Linux' {
        # create a symlinkg in case it does not exist
        file { '/usr/bin/python':
          ensure => 'link',
          target => "/usr/bin/python${python_version}",
        }->
        # export pipenv environment variable
        file {"/etc/profile.d/pipenv_vars.sh":
            content => "export PIPENV_VENV_IN_PROJECT=1",
            mode    => '755',
        }
    }
}