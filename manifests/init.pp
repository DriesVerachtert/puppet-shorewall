class shorewall (
  $package_ipv4_manage = $shorewall::params::package_ipv4_manage,
  $package_ipv6_manage = $shorewall::params::package_ipv6_manage,
  $package_ipv4_ensure = $shorewall::params::package_ipv4_ensure,
  $package_ipv6_ensure = $shorewall::params::package_ipv6_ensure,

  $config_ipv4_zones = $shorewall::params::config_ipv4_zones,
  $config_ipv6_zones = $shorewall::params::config_ipv6_zones,
  $config_ipv4_masq = $shorewall::params::config_ipv4_masq,
  $config_ipv4_interfaces = $shorewall::params::config_ipv4_interfaces,
  $config_ipv6_interfaces = $shorewall::params::config_ipv6_interfaces,
  $config_ipv4_policy = $shorewall::params::config_ipv4_policy,
  $config_ipv6_policy = $shorewall::params::config_ipv6_policy,

  $service_ipv4_manage = $shorewall::params::service_ipv4_manage,
  $service_ipv6_manage = $shorewall::params::service_ipv6_manage,
  $service_ipv4_ensure = $shorewall::params::service_ipv4_ensure,
  $service_ipv6_ensure = $shorewall::params::service_ipv6_ensure,
  $service_ipv4_enable = $shorewall::params::service_ipv4_enable,
  $service_ipv6_enable = $shorewall::params::service_ipv6_enable


) inherits shorewall::params {
  validate_bool($package_ipv4_manage)
  validate_bool($package_ipv6_manage)
  validate_string($package_ipv4_ensure)
  validate_string($package_ipv6_ensure)

  validate_string($config_ipv4_zones)
  validate_string($config_ipv6_zones)
  validate_string($config_ipv4_masq)
  validate_string($config_ipv4_interfaces)
  validate_string($config_ipv6_interfaces)
  validate_string($config_ipv4_policy)
  validate_string($config_ipv6_policy)

  validate_bool($service_ipv4_manage)
  validate_bool($service_ipv6_manage)
  validate_string($service_ipv4_ensure)
  validate_string($service_ipv6_ensure)
  validate_string($service_ipv4_enable)
  validate_string($service_ipv6_enable)
  
  anchor { 'shorewall::begin': } ->
  class { '::shorewall::install': } ->
  class { '::shorewall::config': } ~>
  class { '::shorewall::service': } ->
  anchor { 'shorewall::end': }
}
