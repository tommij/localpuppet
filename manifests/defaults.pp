node 'default' { 
  include defaults
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
    OS Family:${facts['os']['distro']['description']/${facts['os']['architecture']}
    Net: dhcp:${facts['networking']['dhcp']} 
    \n",
  }
}

class stages { 
  stage { 'first': }
  stage { 'second': }
  stage { 'third': }
  stage { 'last': }
  Stage['first'] -> Stage['second'] -> Stage['third'] -> Stage['main'] -> Stage['last']
}

