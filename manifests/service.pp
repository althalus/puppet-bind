class bind::service {
    service {$bind::params::service:
        ensure  => $ensure,
        enable  => true,
        require => Class['bind::install']
    }
}
