# Vagrantfile

# Specify the base box as bento/ubuntu-20.04
Vagrant.configure("2") do |config|
  config.vm.box_download_insecure = true
  config.vm.box = "bento/ubuntu-20.04"
  
  # Define the manager node
  config.vm.define "manager" do |manager|
    manager.vm.hostname = "manager"
    manager.vm.network "private_network", ip: "192.168.10.2"
    manager.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--cpus", "1"] # Set number of CPUs to 1
      v.customize ["modifyvm", :id, "--memory", "512"] # Set memory to 512MB
    end
    
    # Provision the manager node
    manager.vm.provision "shell", path: "dockerProvisioning.sh"
  end

  # Define worker node 1
  config.vm.define "worker1" do |worker1|
    worker1.vm.hostname = "worker1"
    worker1.vm.network "private_network", ip: "192.168.10.3"
    worker1.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--cpus", "1"] # Set number of CPUs to 1
      v.customize ["modifyvm", :id, "--memory", "512"] # Set memory to 512MB
    end
    
    # Provision worker node 1
    worker1.vm.provision "shell", path: "dockerProvisioning.sh"
  end

  # Define worker node 2
  config.vm.define "worker2" do |worker2|
    worker2.vm.hostname = "worker2"
    worker2.vm.network "private_network", ip: "192.168.10.4"
    worker2.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--cpus", "1"] # Set number of CPUs to 1
      v.customize ["modifyvm", :id, "--memory", "512"] # Set memory to 512MB
    end

    # Provision worker node 2
    worker2.vm.provision "shell", path: "dockerProvisioning.sh"
  end
end
