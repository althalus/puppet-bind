class bind::service {
    service {'bind':
        ensure  => $ensure,
        enable  => true,
        require => Class['bind::install']
    }
}
