Facter.add('solaris_zones') do
  confine :osfamily => :solaris
  setcode do
    if Facter.value('virtual') != 'zone' 
      zone_list = Facter::Util::Resolution.exec('/usr/sbin/zoneadm list').chomp
      zone_list.gsub!(/^global\n/, '')
      zone_list.gsub /\n/, ','
    end
  end
end
