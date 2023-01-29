# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    
    config.ssh.insert_key = false
  
    config.vm.define "docker" do |docker|
      docker.vm.box = "shekeriev/debian-11"
      docker.vm.hostname = "docker.do2.lab"
      docker.vm.network "private_network", ip: "192.168.99.100"
      docker.vm.provision "shell", path: "shell-scripts/tfm-install.sh"
      docker.vm.provision "shell", path: "shell-scripts/ansible-req.sh"
      docker.vm.provision "ansible_local" do |ansible|
        ansible.become = true
        ansible.install_mode = :default
        ansible.playbook = "playbook.yml"
        ansible.galaxy_role_file = "requirements.yml"
        ansible.galaxy_roles_path = "/etc/ansible/roles"
        ansible.galaxy_command = "sudo ansible-galaxy install --role-file=%{role_file} --roles-path=%{roles_path} --force"
      end
      docker.vm.provision "shell", path: "shell-scripts/terraform.sh"
    end

    config.vm.define "web" do |web|
      web.vm.box = "shekeriev/centos-stream-8"
      web.vm.hostname = "web.do2.lab"
      web.vm.network "private_network", ip: "192.168.99.101"
      web.vm.provision "shell", path: "shell-scripts/puppet.sh"
      web.vm.provision "shell", path: "shell-scripts/puppet-web.sh"
      
      web.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "web.pp"
        puppet.options = "--verbose --debug"
      end
    end

    config.vm.define "db" do |db|
      db.vm.box = "shekeriev/centos-stream-8"
      db.vm.hostname = "db.do2.lab"
      db.vm.network "private_network", ip: "192.168.99.102"
      db.vm.provision "shell", path: "shell-scripts/puppet.sh"
      db.vm.provision "shell", path: "shell-scripts/puppet-db.sh"
      db.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "db.pp"
        puppet.options = "--verbose --debug"
      end
    end
 end