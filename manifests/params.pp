class shorewall::params {
  $package_ipv4_manage = true,
  $package_ipv6_manage = true,

  $package_ipv4_ensure = 'present',
  $package_ipv6_ensure = 'present',
  
  $config_ipv4_zones_content = '',
  $config_ipv4_masq_content = '',

  $service_ipv4_manage = true,
  $service_ipv6_manage = true,

  $service_ipv4_ensure = 'running',
  $service_ipv6_ensure = 'running',

  $service_ipv4_enable = 'enable',
  $service_ipv6_enable = 'enable',

  $default_config_ipv4_zones_file = '/etc/shorewall/zones',
  $default_config_ipv4_masq_file = '/etc/shorewall/masq',

  $default_service_ipv4_name = 'shorewall',
  $default_service_ipv6_name = 'shorewall6',

  case $::osfamily ? {
    'RedHat': {
      $package_ipv4_name = 'shorewall',
      $package_ipv6_name = 'shorewall6',
      $config_ipv4_zones_file = $default_config_ipv4_zones_file,
      $config_ipv4_masq_file = $default_config_ipv4_masq_file,
      $service_ipv4_name = $default_service_ipv4_name,
      $service_ipv6_name = $default_service_ipv6_name,
    }
    # patches to support other distributions or operating systems always welcome!
    default: {
      fail("The ${module_name} module is not yet supported on an ${::osfamily} based system.")
    }
  }
}
