define zone (
    $ensure   = 'present',
    $zonefile = '${name}.dns',
    $masters  = [],
    $type     = "master",
) {
    exec { "reload-${name}":
        command = "/sbin/rndc-reload ${name}",
        refreshonly => true,
        unless => "/usr/bin/test ! -f ${bind::zonefile_dir}/{$zonefile}",
    }

    file { "${bind::zonefile_dir}/${zonefile}":
        ensure => $ensure,
        owner => 'root',
        group => 'root',
        mode => '0644',
        source => 'puppet:///modules/bind/$zonefile',
        notify => Exec["reload-${name}"]
    }

    concat::fragment {"named.local_${name}":
        target => "/etc/bind/named.local",
        content => template("bind/zonedef.erb") 
    }
}
