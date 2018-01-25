class profile::ocr_dev{
    package{'swig': ensure => 'installed'}->
    package{'swig-sphinxbase': ensure => 'installed'}->
    package{'libpulse-dev': ensure =>'installed'}
    
}