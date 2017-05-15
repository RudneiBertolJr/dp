#this is client hp data protector
class dataprotector::agent (
  $version = ::dataprotector::agent

) inherits params {

  package { 'omnicf':
    ensure => present,
  }



}
