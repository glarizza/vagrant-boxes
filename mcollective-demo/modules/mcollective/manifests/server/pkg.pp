class mcollective::server::pkg {

  include 'mcollective::pkg'

  package { 'mcollective':
	#ensure	  => "1.2.0-5.el5",
    ensure	  => latest,
	require   => $operatingsystem ? {
	  /(?i-mx:ubuntu|debian)/ 	=> Class['mcollective::pkg::debian'],
	  default					=> Class['mcollective::pkg::redhat'],
	},
    provider  => $mcollective::params::pkg_provider,
  }
}
