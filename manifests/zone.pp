define zone (
    $ensure       = 'present',
    $zonefile     = '${name}.dns',
    $masters      = [],
    $type         = "master",
    $allow_update = undef,
    $allow_query  = undef,
    $allow_notify = undef,
) {
    exec { "reload-${name}":
        command = "/sbin/rndc-reload ${name}",
        refreshonly => true,
        unless => "/usr/bin/test ! -f ${bind::params::zonefile_dir}/{$zonefile}",
    }

    file { "${bind::params::zonefile_dir}/${zonefile}":
        ensure => $ensure,
        owner => 'root',
        group => 'root',
        mode => '0644',
        source => 'puppet:///modules/site-bind/$zonefile',
        notify => Exec["reload-${name}"]
    }

    concat::fragment {"named.local_${name}":
        target => "/etc/bind/named.local",
        content => template("bind/zonedef.erb"),
        priority => 15,
    }
}
