class activemq::pkg(
  $pkg_provider = $activemq::params::pkg_provider,
  $pkg_state	= $activemq::params::pkg_state
) inherits activemq::params {

  case $operatingsystem {
    debian,ubuntu: {
      class { 'activemq::pkg::debian':
        pkg_provider => $pkg_provider,
        pkg_state    => $pkg_state,
      }
    }
    centos,redhat,fedora: {
      class { 'activemq::pkg::redhat':
        pkg_provider => $pkg_provider,
        pkg_state    => $pkg_state,
      }
    }
  }
}