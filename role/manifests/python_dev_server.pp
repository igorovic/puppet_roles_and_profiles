# This role will deploy a python development server with fully configured database if specified
#
# This role uses yaml files to configure. 
# Available parameters to use in your yaml file.
#   Yaml Parameters
#   ===============
#   profile::python::python_version: '3'
#   profile::database_server::database_engine: 'postgresql'
#   profile::database_server::databases:
#     <dbname>:
#       user: <user name>
#       password: <user password>
# 
#  Notice:
#  keep your user's password in a separate secret eyaml file in an encrypted format
class role::python_dev_server {
    include profile::base
    include profile::python
    include profile::database_server
}