puppet-bind
===========

A somewhat opinionated puppet module to manage bind9 configuration and zones.

Usage
-----

    class {'bind': }
    bind::zone { 'example1.com': }
    bind::zone { 'example2.com': }
    
By default, this will source the zone files from `puppet:///site-bind/example1.com.dns` and `puppet:///site-bind/example2.dns`, so you will need to create the site-bind module, and add your zone files to it.