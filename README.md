puppet-bind
===========

A somewhat opinionated puppet module to manage bind9 configuration and zones.

Usage
-----

Basic usage:

    class {'bind': }
    bind::zone { 'example1.com': }
    bind::zone { 'example2.com': }
    
This will source the zone files from `puppet:///site-bind/example1.com.dns`