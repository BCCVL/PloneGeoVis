# -*- mode: ruby -*-
# vi: set ft=ruby :

UI_URL = "https://launchpad.net/plone/4.3/4.3/+download/Plone-4.3-UnifiedInstaller.tgz"
UI_OPTIONS = "standalone --password=admin --static-lxml=yes"

Vagrant::Config.run do |config|
  config.vm.box     = "centos-64-x64-vbox4210"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"

  config.vm.forward_port 8080, 8080

  # Run yum update as a separate step in order to avoid
  # package install errors
  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = "yum_update.pp"
    puppet.manifests_path = "manifests"
  end

  # Configure the firewall
  config.vm.provision :shell do |shell|
    shell.path = "manifests/configure_firewall.sh"
  end

  # Install CentOS dependencies
  # package install errors
  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = "centos_dependencies.pp"
    puppet.manifests_path = "manifests"
  end

  # ensure we have the packages we need
  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = "plone.pp"
    puppet.manifests_path = "manifests"
  end

  # Create a Putty-style keyfile for Windows users
  config.vm.provision :shell do |shell|
    shell.path = "manifests/host_setup.sh"
    shell.args = RUBY_PLATFORM
  end

  # install Plone
  config.vm.provision :shell do |shell|
    shell.path = "manifests/install_plone.sh"
    shell.args = UI_URL + " '" + UI_OPTIONS + "'"
  end
end
