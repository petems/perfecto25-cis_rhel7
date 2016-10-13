require 'facter'

Facter.add('cis_centos_7_rule_1_2_3') do
  confine :osfamily => 'RedHat'
  setcode do
    grep_check = Facter::Core::Execution.exec('grep -q ^[\s]*gpgcheck[\s]*=[\s]*1[\s]*$ /etc/yum.conf && echo true')

    if grep_check == 'true'
      true
    else
      false
    end
  end
end
