class shorewall::service inherits shorewall {
  if ! (($service_ipv4_ensure in [ 'running', 'stopped' ]) {
    fail('service_ipv4_ensure parameter must be running or stopped')
  }
  if ! (($service_ipv6_ensure in [ 'running', 'stopped' ]) {
    fail('service_ipv6_ensure parameter must be running or stopped')
  }

  if $service_ipv4_manage == true {
    service { 'shorewall':
      ensure => $service_ipv4_ensure,
      enable => $service_ipv4_enable,
      name => $service_ipv4_name,
      hasstatus => true,
      hasrestart => true,
    }
  }
  if $service_ipv6_manage == true {
    service { 'shorewall6':
      ensure => $service_ipv6_ensure,
      enable => $service_ipv6_enable,
      name => $service_ipv6_name,
      hasstatus => true,
      hasrestart => true,
    }
  }
}
