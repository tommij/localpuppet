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
    content => "Hello world!
    virtual: ${facts['is_virtual'} 
    OS FAMILY:${facts['os']['family']}
    more dims/n",
  }
}

class stages { 
  stage { 'first': }
  stage { 'second': }
  stage { 'third': }
  stage { 'last': }
  Stage['first'] -> Stage['second'] -> Stage['third'] -> Stage['main'] -> Stage['last']
}

