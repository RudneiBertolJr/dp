class dataprotector::install {



	package { 'xinetd':
		ensure => present
	}

	service { 'xinetd':
		ensure => running,
		enable => true,
	}


}
