class mcollective::pkg::redhat(
  $pkg_provider = undef,
  $pkg_state    = 'present'
) {

  package { 'rubygem-stomp':
    ensure    	=> $pkg_state,
    provider  	=> $pkg_provider,
	require		=> Yumrepo['puppet-prosvc'],
  }
}