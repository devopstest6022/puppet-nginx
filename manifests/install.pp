class nginx::install(
  $package_ensure = $::nginx::package_ensure,
  $package_name   = $::nginx::package_name,
) {
  package { 'install_nginx':
    ensure => $package_ensure,
    name   => $package_name,
  }
}
