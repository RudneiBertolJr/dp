class dataprotector::params {

  $is_agent   = true
  $is_is      = false
  $dp_version = '08.10-1'
  $dp_port    = 5555

  case $facts[os][family] {
    'RedHat': {
			#Define architecture
      case $facts[os][architecture] {
        'x86_64': {
          $agent_package = ["OB2-CORE-A.${dp_version}.x86_64.rpm", "OB2-DA-A.${dp_version}.x86_64.rpm" ]
				}
        default: {  
          $agent_package = "OB2-CORE-A.${dp_version}.i386.rpm" 
        }
    }
      case $facts[os][release][major] {
        '7': {
          if $firewalld_state {
        	  firewalld_port { 'Allow inbound HP DataProtector 5555':
  				  	ensure   => present,
  					  zone     => 'public',
  					  port     => $dp_port,
  					  protocol => 'tcp',
					  }
				  }
        }
        default: { 
          firewall { '5555 HP DataProtector':
            chain    => 'INPUT',
					  dport    => "${dp_port}",
					  proto    => 'tcp',
					  action   => 'accept',
  					provider => 'iptables',
					}
        }
    }
  
  
    #  default: { notify{ 'This OS not supported': } }
  }

 }
}
