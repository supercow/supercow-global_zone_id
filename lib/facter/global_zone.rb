Facter.add('global_zone') do
  setcode do
    if File.exist?('/etc/global_zone')
      Facter::Util::Resolution.exec '/bin/cat /etc/global_zone'
    end
  end
end
