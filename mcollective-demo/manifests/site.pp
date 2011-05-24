node default {
  class { 'vagrant': }
  class { 'mcollective::server::base': }
}

node "aserver.puppetlabs.lan" {
  class { 'vagrant': }
  class { 'activemq::base': }
  class { 'mcollective::server::base': }
  exec { 'certname':
	command		=> '/usr/local/bin/puppet --configprint certname',
	logoutput	=> true,
  }
  class { 'mcollective::client::base': }
}
