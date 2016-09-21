node client01 {
  file { "/tmp/fiskening": 
    ensure => present,
    content => "DIIIIIMS"
  }
}
