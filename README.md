Solaris Global Zone ID
======================

A Solaris zone is a container that provides an independent virtual machine
(called a "zone" or "non-global zone") available in Solaris 10 and newer.

This module provides two custom facts for working with these zones.

Basic Usage
-----------

For the global\_zone fact to be available on a non-global zone, the
global\_zone\_id class must be applied to the global zone which hosts it.

    # On the node acting as a global zone:
    include global_zone_id

No puppet code needs to be applied on non-global zones. The facts can be
viewed after puppet completes a plugin-sync (typically during each puppet run)
either by querying the inventory service (see "inventory" under the node's
page in the Puppet Enterprise console) or by using the facter executable:

    root@zone1:# facter global_zone
    globalzone.example.com


Custom Facts
------------
  * solaris\_zones: This fact enumerates all non-global zones on the current
  global zone, excluding the global zone itself,  using the command
  'zoneadm list'. Zone names are returned as a comma-separated string.

  * global\_zone: This fact reads the /etc/global\_zone file and returns the
  value. This file should be set by the global zone by applying the
  global\_zone\_id class.

License
-------

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


Contact
-------

James Sweeny
james.sweeny@puppetlabs.com

Support
-------

Please log issues at the project site at 
