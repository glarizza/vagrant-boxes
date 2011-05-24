class mcollective::client::base {

  class { 'mcollective::client::config': }
  class { 'mcollective::client::pkg': }
  mcollective::plugins::plugin { 'registration':
    ensure      => present,
    type        => 'agent',
    ddl         => false,
    application => false,
  }
}
