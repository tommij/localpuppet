node 'default' { 
  class { "defaults": }
}
class defaults () { 
  include stages
  class { 'apt': 
    update => {
    frequency => 'daily',
    stage => first,
    },
  }
  class { 'motd':
    content => "
    Virtual::${facts['is_virtual']} ${facts['virtual']}
    OS Family:${facts['os']['family']}
    OS Family:${facts['os']['distro']['description']} ${facts['os']['architecture']} @ ${facts['kernelrelease']}
    Net: dhcp:${facts['networking']['dhcp']} 
    \n",
  }
  file { "/tmp/nisse": 
    ensure => present,
    content => "du er er nisse"
  }
}

class stages { 
  stage { 'first': }
  stage { 'second': }
  stage { 'third': }
  stage { 'last': }
  Stage['first'] -> Stage['second'] -> Stage['third'] -> Stage['main'] -> Stage['last']
}

