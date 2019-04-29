versao = '2.6.1'
usuario = 'vagrant'

rbenv_user_install usuario

# instala o construtor de rubies como plugin
rbenv_plugin 'ruby-build' do
  git_url 'https://github.com/rbenv/ruby-build.git'
  user usuario
end

# instala o ruby com a versão especificada
rbenv_ruby versao do
  user usuario
end

# seta a versão especificada como global
rbenv_global versao do
  user usuario
end

# instalar bundler
rbenv_gem 'bundler' do
  # options '--no-ri --no-doc' # deprecated
  rbenv_version versao
  user usuario
end

# instalar foreman
rbenv_gem 'foreman' do
  # options '--no-ri --no-doc' # deprecated
  rbenv_version versao
  user usuario
end

# carrega novos executáveis gerados pelos passos anteriores
rbenv_rehash 'rehash' do
  user usuario
end
