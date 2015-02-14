class shorewall::install inherits shorewall {
  if $package_ipv4_manage {
    package { $package_ipv4_name:
      ensure => $package_ipv4_ensure,
    }
  }
  if $package_ipv6_manage {
    package { $package_ipv6_name:
      ensure => $package_ipv6_ensure,
    }
  }
}
