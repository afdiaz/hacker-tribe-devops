# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos-65-x64"
  config.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box'
  config.vm.hostname = 'hackertribe.startupchile.vm'
  config.vm.network :private_network, ip: "192.168.33.10"
  

  config.vm.provision :shell do |shell|
  shell.inline = "mkdir -p /etc/puppet/modules;
                  puppet config print --modulepath /etc/puppet/modules:/home/vagrant/.puppet/modules:/usr/share/puppet/modules
                  puppet module install --force --target-dir /usr/share/puppet/modules puppetlabs/stdlib
                  puppet module install --force --target-dir /usr/share/puppet/modules puppetlabs-concat
                  puppet module install --force --target-dir /usr/share/puppet/modules puppetlabs-apache
                  "
  end
  
 #Provision our machine with puppet
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "init.pp"
  end
  
end
