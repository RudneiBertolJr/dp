class dataprotector::agent(

$agent_package = $::dataprotector::params::agent_package,
) {


$agent_package.each | String $pkg| {
 notify { $pkg: }

file { "/tmp/${pkg}":
	ensure => present,
	source => "puppet:///modules/dataprotector/${pkg}",
}


package { $pkg:
	ensure => present,
        source => "/tmp/${pkg}",
        require => File["/tmp/${pkg}"],
        provider => 'rpm',
}


}
}
