class mcollective::server::service {

  case $operatingsystem {
    debian,ubuntu: {
      $service_start = 'RUBYLIB=/usr/src/facter/lib:/usr/src/puppet/lib:$RUBYLIB /etc/init.d/mcollective start'
	  $service_stop  = 'RUBYLIB=/usr/src/facter/lib:/usr/src/puppet/lib:$RUBYLIB /etc/init.d/mcollective stop'
    }
    centos,redhat,fedora: {
      $service_start = 'RUBYLIB=/usr/src/facter/lib:/usr/src/puppet/lib:$RUBYLIB /sbin/service mcollective start'
	  $service_stop  = 'RUBYLIB=/usr/src/facter/lib:/usr/src/puppet/lib:$RUBYLIB /sbin/service mcollective stop'
    }
  }

  service { 'mcollective':
    ensure     => running,
    enable     => false,
    hasstatus  => true,
    start      => $service_start,
    stop       => $service_stop,
    require    => Class['mcollective::pkg'],
    subscribe  => Class['mcollective'],
  }

}
