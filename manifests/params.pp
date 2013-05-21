class uwsgi::params {
    case $::operatingsystem {
        Debian,Ubuntu: {
            $package      = 'bind9',
            $zonefile_dir = '/var/cache/bind',
            $service      = 'bind9'
        }
        default: {
            notify { "${module_name}_unsupported":
                message => "The ${module_name} module is not supported on ${operatingsystem}"
            }
        }
    }
}
