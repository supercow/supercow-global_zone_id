# Class global_zone_id
#
# This class should be applied to every global zone
#
# it will ensure the existance of a file called /etc/global_zone
# on each zone so the facts attached to this module can discover
# the global zone name.

class global_zone_id {

  if $::virtual == 'zone' or $::osfamily != 'Solaris' {
    fail 'The class global_zone_id should only be applied to a Solaris global zone'
  }

  if $::solaris_zones != undef {
    $zone_array = split($::solaris_zones,',')
    global_zone_id::global_zone_id_file { $zone_array: }
  } else {
    notify { 'No solaris_zones fact.': }
  }
}

