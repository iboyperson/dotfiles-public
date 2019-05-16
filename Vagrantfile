# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "generic/arch"
  # config.vm.box = "archlinux/archlinux"

  # config.vm.provision "shell", inline: $bootstrap

  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  config.ssh.insert_key = 'true'

  config.vm.synced_folder ".", "/dotfiles", disabled: false,
    group: "users",
    mount_options: ["dmode=775,fmode=664"]

  config.vm.provider "virtualbox" do |v|
    v.name = "arch_vm"
    v.memory = 4024
    v.customize ["modifyvm", :id, "--vram", "128"]
    v.cpus = 2
    v.gui = true
  end
end
