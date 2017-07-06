class dataprotector::params {

  $is_agent   = true
  $is_is      = false
  $dp_version = '08.10-1'

  case $facts[os][family] {
    'RedHat': {
      case $facts[os][architecture] {
        'x86_64': {
          $agent_package = ["OB2-CORE-A.${dp_version}.x86_64.rpm", "OB2-DA-A.${dp_version}.x86_64.rpm" ]
	}
        default: {  
          $agent_package = "OB2-CORE-A.${dp_version}.i386.rpm" 
        }
    }
  
    #default: { notify{ 'This OS not supported': } }
  }

 }
}
