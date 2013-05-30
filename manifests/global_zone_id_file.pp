# Define global_zone_id
# This defined type is used to generate the global_zone file on each zone
# The file is needed by the global_zone fact which collects this information.
define global_zone_id::global_zone_id_file() {
  file { "/zones/${name}/root/etc/global_zone":
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    content => $::fqdn,
  }
}
