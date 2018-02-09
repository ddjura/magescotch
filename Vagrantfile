# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.0.0"

Vagrant.configure("2") do |config|

    config.vm.box = "creatuity/MageScotchBox"
    config.vm.box_version = ">= 2.1.5"
    config.vm.network "private_network", ip: "192.168.34.10"
    config.vm.provision "fix-no-tty", type: "shell" do |s|
    	s.privileged = false
    	s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
    end

    config.vm.provision "file", source: "~/.ssh", destination: "~/.ssh"
    config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
    config.vm.provision :shell, path: "bootstrap.sh"
    config.vm.provision :shell, path: "local-bootstrap.sh"
    config.vm.hostname = "magescotch"
#     config.vm.synced_folder ".", "/vagrant", disabled: false

  host = RbConfig::CONFIG['host_os']

   #config.vm.synced_folder "./", "/var/www"
    
  # mem = mem / 1024 / 4
    if host =~ /darwin/
        mem = `sysctl -n hw.memsize`.to_i / 1024
    elsif host =~ /linux/
        mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i
    elsif host =~ /mswin|mingw|cygwin/
        mem = `wmic computersystem Get TotalPhysicalMemory`.split[1].to_i / 1024
    end
      
  mem = mem / 1024 / 4
    config.vm.provider "virtualbox" do |v|
  	v.cpus = 2
        v.customize ["modifyvm", :id, "--memory", mem]
    end

    config.ssh.forward_agent = true

end
