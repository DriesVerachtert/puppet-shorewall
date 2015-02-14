class shorewall (
	$zones = $shorewall::params::zones,
	$masq = $shorewall::params::masq,
) inherits shorewall::params {

	anchor { 'shorewall::begin': } ->
	class { '::shorewall::install': } ->
	class { '::shorewall::config': } ~>
	class { '::shorewall::service': } ->
	anchor { 'shorewall::end': }
}
