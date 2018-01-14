# This profile manages the python installation
#
# @param python_version     The python's version to install
# 
#
class profile::python(
    $python_version          = '3',
    $dev                     = false,
){
    class { 'profile::python::install':
        python_version => $python_version,
        dev            => $dev,
    }
    
}
