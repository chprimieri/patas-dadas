Projeto do site de voluntários da ONG Patas Dadas.


** AMBIENTE DE DESENVOLVIMENTO **

INSTALAÇÃO
- No Windows:
	Instalar:
		Oracle VM VirtualBox 5.2.18
		Vagrant 2.1.5

	Plugin do Chef:
		vagrant plugin install vagrant-librarian-chef-nochef

	Clonar repositório git:
		git clone https://github.com/chprimieri/patas-dadas.git
	
	Configurar git:
		git config --global user.name "Gandalf Júnior"
		git config --global user.email "gandalf@grey.cat"

	Levantar a VM:
		cd patasdadas
		vagrant up
		vagrant ssh

	Dentro da VM:
		cd \vagrant
		gem install bundler
		rbenv rehash
		bundle install
		rbenv rehash

	Rails Server:
		rails server -b 0.0.0.0

	Acessar em:
		http://localhost:3000

