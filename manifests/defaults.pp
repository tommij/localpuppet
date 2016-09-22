class defaults () { 
  include stages
  class { 'apt': 
    update => {
    frequency => 'daily',
    stage => first,
    },
  }
  class { '::ntp': } 
}

class stages { 
  stage { 'first': }
  stage { 'second': }
  stage { 'third': }
  stage { 'last': }
  Stage['first'] -> Stage['second'] -> Stage['third'] -> Stage['main'] -> Stage['last']
}

