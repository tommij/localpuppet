node client01 {
  class { 'apt':
    update => {
    frequency => 'daily',
    },
  }
}
node client02 {
  class { 'apt':
    update => {
    frequency => 'daily',
    },
  }
}
