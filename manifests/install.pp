# == Class: sysstat::install
#
# This class should be considered private.
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2013 Joshua Hoblitt
#
class sysstat::install {

 case $::osfamily {
  'debian': {
              package { $sysstat::params::sysstat_package:
                        ensure => present,
                      }

              augeas { '/etc/default/sysstat':
              context => '/files/etc/default/sysstat/',
              changes => 'set ENABLED true',
              require => Package['sysstat'],}
            }
  default:  
              package { $sysstat::params::sysstat_package:
              ensure => present, }
            }

                }
}

