class dataprotector::agent(

$agent_package = $::dataprotector::params::agent_package,
) {


$agent_package.each | String $pkg| {

  file { "/tmp/${pkg}":
	ensure => present,
	source => "puppet:///modules/dataprotector/${pkg}",
  }

  exec { "Install $pkg":
	command => "rpm -i /tmp/${pkg}",
	path    => ['/bin/','/sbin','/usr/bin','/usr/sbin'],
	unless  => "test -e /tmp/${pkg}",
  notify  => Service['xinetd'],
  }

}
}
