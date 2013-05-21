class bind (
    $package_version = 'installed',
) inherits bind::params {
    include bind::install
    include bind::service

    include concat::setup

    concat { "/etc/bind/named.local":
        owner => 'root',
        group => 'root',
        mode  => '0644',
        notify => Service['bind']
    }
}
