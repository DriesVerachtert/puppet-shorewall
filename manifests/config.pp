class shorewall::config inherits shorewall {
  file { $config_ipv4_zones_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0600',
    content => $config_ipv4_zones,
  }
  file { $config_ipv6_zones_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0600',
    content => $config_ipv6_zones,
  }
  file { $config_ipv4_masq_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0600',
    content => $config_ipv4_masq,
  }
  file { $config_ipv4_interfaces_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0600',
    content => $config_ipv4_interfaces,
  }
  file { $config_ipv4_policy_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0600',
    content => $config_ipv4_policy,
  }
}