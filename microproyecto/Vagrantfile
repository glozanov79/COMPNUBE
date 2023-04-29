# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  if Vagrant.has_plugin? "vagrant-vbguest"
    config.vbguest.no_install  = true
    config.vbguest.auto_update = false
    config.vbguest.no_remote   = true
  end
  config.vm.define :servidor1 do |servidor1|
    servidor1.vm.box = "bento/ubuntu-22.04"
    servidor1.vm.network :private_network, ip: "192.168.100.3"
    servidor1.vm.hostname = "servidor1"
    servidor1.vm.provision "shell", path: "script_servidor1.sh"
  end
  config.vm.define :servidor2 do |servidor2|
    servidor2.vm.box = "bento/ubuntu-22.04"
    servidor2.vm.network :private_network, ip: "192.168.100.4"
    servidor2.vm.hostname = "servidor2"
    servidor2.vm.provision "shell", path: "script_servidor2.sh"
  end
  config.vm.define :servidor3 do |servidor3|
    servidor3.vm.box = "bento/ubuntu-22.04"
    servidor3.vm.network :private_network, ip: "192.168.100.5"
    servidor3.vm.hostname = "servidor3"
    servidor3.vm.provision "shell", path: "script_servidor3.sh"
  end
  config.vm.define :balanceadorCargaHAProxy do |balanceadorCargaHAProxy|
    balanceadorCargaHAProxy.vm.box = "bento/ubuntu-22.04"
    balanceadorCargaHAProxy.vm.network :private_network, ip: "192.168.100.2"
    balanceadorCargaHAProxy.vm.hostname = "balanceadorCargaHAProxy"
    balanceadorCargaHAProxy.vm.provision "shell", path: "script_balanceadorCargaHAProxy.sh"
  end
end
