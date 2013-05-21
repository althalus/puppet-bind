class bind (
    $package_version = 'installed',
) inherits bind::params {
    include bind::install
    include bind::service

    include concat::setup

    concat { "/etc/bind/named.conf.local":
        owner => 'root',
        group => 'root',
        mode  => '0644',
        notify => Service['bind']
    }
    
    file { "/etc/bind/named.conf.options":
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('bind/named.conf.options.erb'),
}
