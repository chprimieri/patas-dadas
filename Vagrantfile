# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/bionic64'

  # Configurate the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    # permitir criação de symlinks (npm inteiro depende disso)
    # importante: para isto funcionar você TEM que rodar seu console em modo Administrador!
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
    vb.cpus = 2
  end

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3000, auto_correct: true
  config.vm.network :forwarded_port, guest: 3035, host: 3035, auto_correct: true # para auto-refresh de assets sem precisar dar F5

  config.vm.network :forwarded_port, guest: 4000, host: 4000, auto_correct: true
  config.vm.network :forwarded_port, guest: 5000, host: 5000, auto_correct: true
  config.vm.network :forwarded_port, guest: 6000, host: 6000, auto_correct: true
  config.vm.network :forwarded_port, guest: 7000, host: 7000, auto_correct: true

  # para acesso por outras VMs no mesmo host
  # config.vm.network :private_network, ip: '192.168.33.10'
  config.vm.network :public_network

  # Pasta compartilhada para acessar as engines
  # config.vm.synced_folder "../engines/", "/engines"

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = [ 'cookbooks', 'cookbooks_patas' ]

    chef.add_recipe "apt"
    # chef.add_recipe "nodejs"
    # chef.add_recipe "ruby_build"
    chef.add_recipe "vim"
    chef.add_recipe "yarn::default"

    # recipe custom pra instalar rbenv e o(s) ruby(ies) necessário(s)
    chef.add_recipe 'patas::instalar_rbenv'
  end

  # para instalar gem pg, que conecta a app ao banco Postgresql
  config.vm.provision :shell, inline: 'sudo apt-get install -y postgresql-client libpq5 libpq-dev' # && gem install pg'

  # para instalar gem sqlite3, para trabalhar com banco SQLite (dev e/ou test)
  config.vm.provision :shell, inline: 'sudo apt-get install -y libsqlite3-dev'

  # instala o Node via repositórios (única forma conhecida para versões 6+)
  $script = <<-SCRIPT
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt-get install -y nodejs
  SCRIPT
  config.vm.provision :shell, inline: $script, privileged: false

  # biblioteca QT para usar Capybara
  # config.vm.provision :shell, inline: 'sudo apt-get install -y libqt4-dev libqtwebkit-dev'

  # descomente ara instalar Chrome + ChromeDriver, para testes de aceitação com Capybara
  $script = <<-SCRIPT
    sudo apt-get update
    sudo apt-get install -y libappindicator1 fonts-liberation

    sudo apt-get -f install
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome*.deb

    sudo apt-get install unzip
    wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/73.0.3683.20/chromedriver_linux64.zip && sudo unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/;
  SCRIPT
  config.vm.provision :shell, inline: $script, privileged: false
end
