node client01 {
  file { "/tmp/fiskening": 
    ensure => present,
    content => "DIIIIIMS"
  }
  class { '::mcollective':
    middleware_hosts => [ 'puppet' ],
    manage_packages => false,
    collectives => rar, bar
  }
}
node client02 {
  class { '::mcollective':
    middleware_hosts => [ 'puppet' ],
    manage_packages => false,
  }
}
