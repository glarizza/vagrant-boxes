class mcollective::server::base {

  class { 'mcollective': }
  class { 'mcollective::server::pkg': }
  class { 'mcollective::server::service': }
  class { 'mcollective::server::config': }
  class { 'mcollective::plugins': }
  mcollective::plugins::plugin { 'facter_facts':
    ensure => present,
    type   => 'facts',
  }
  mcollective::plugins::plugin { 'service':
    ensure      => present,
    type        => 'agent',
    ddl         => true,
    application => true,
  }
  mcollective::plugins::plugin { 'package':
    ensure      => present,
    type        => 'agent',
    ddl         => true,
    application => true,
  }
  mcollective::plugins::plugin { 'meta':
    ensure      => present,
    type        => 'registration',
    ddl         => false,
    application => false,
  }
}
