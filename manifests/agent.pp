#this is client hp data protector
class dataprotector::agent (
  $version = ::dataprotector::agent

) inherits params {

  package { 'omnicf':
    ensure => present,
  }

  /*
  package { 'package':
    provider         => 'rpm',
    ensure      => installed,
    source => "${examplerpm::rpm}"
  }

*/
}
