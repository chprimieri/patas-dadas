# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/bionic64'

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3000, auto_correct: true

  # Proxy da CMPA
  config.proxy.http = 'http://lproxycmpa.cmpa.local:3128'
  config.proxy.https = 'http://lproxycmpa.cmpa.local:3128'
  config.proxy.no_proxy = 'localhost,127.0.0.1'

  # Drama da clonagem da máquina com a chave errada
  config.ssh.private_key_path = 'D:\\projetos\\patas-dadas\\.vagrant\\.ssh\\id_rsa'

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.arguments = "--chef-license accept"
    
    chef.cookbooks_path = [ 'cookbooks', 'cookbooks_patas' ]

    chef.add_recipe "apt"
    # chef.add_recipe "nodejs"
    chef.add_recipe "vim"
    chef.add_recipe "yarn::default"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "postgresql::client"

    # recipe custom pra instalar rbenv e o(s) ruby(ies) necessário(s)
    chef.add_recipe 'patas::instalar_rbenv'
  end

  # para instalar gem sqlite3, para trabalhar com banco SQLite (dev e/ou test)
  config.vm.provision :shell, inline: 'sudo apt-get install -y libsqlite3-dev'

end
