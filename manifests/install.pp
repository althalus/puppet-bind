class bind::install {
    package { $bind::params::package:
        ensure => $bind::package_version,
    }
}
