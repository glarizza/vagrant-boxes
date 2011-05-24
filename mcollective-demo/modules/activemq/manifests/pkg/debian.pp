class activemq::pkg::debian(
  $pkg_provider = undef,
  $pkg_state    = 'present'
) {

  package { "activemq":
    ensure   => $pkg_state,
    provider => $pkg_provider,
  }
}