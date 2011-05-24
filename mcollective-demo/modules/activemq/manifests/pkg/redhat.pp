class activemq::pkg::redhat(
  $pkg_provider = undef,
  $pkg_state    = 'present'
) {

  package { 'activemq':
    ensure    	=> $pkg_state,
    provider  	=> $pkg_provider,
	require		=> Yumrepo['mnx-repo'],
  }
}