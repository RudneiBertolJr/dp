class dataprotector::agent(

$agent_package = $::dataprotector::params::agent_package,
) {


$agent_package.each | String $pkg| {

  file { "/tmp/${pkg}":
	ensure => present,
	source => "puppet:///modules/dataprotector/${pkg}",
  }

/*
  package { $pkg:
	ensure => present,
        source => "/tmp/${pkg}",
        provider => 'rpm',
	subscribe => File["/tmp/${pkg}"],
  }
*/

  exec { "Install $pkg":
	command => "rpm -i /tmp/${pkg}",
	path => ['/bin/','/sbin','/usr/bin','/usr/sbin'],
	unless => "test -e /tmp/${pkg}",	
  }

}
}
