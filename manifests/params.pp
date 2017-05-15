#this is client hp data protector
class dataprotector::params (
  $version,
  $packages = ['ksh','ncompress','xinetd']
) {

    package { "${package}":
      ensure => present,
    }

}
