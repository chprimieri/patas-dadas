# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'
I18n.reload!

Faker::Config.locale = 'pt-BR'

# Pessoa.destroy_all

# 50.times do |index|
#   Pessoa.create!( nome: Faker::Name.unique.name,
#   								data_de_nascimento: Faker::Date.birthday(18, 65),
#                   email: Faker::Internet.unique.email,
#                   telefone: Faker::PhoneNumber.phone_number,
#                   foto: "pessoa.jpg")
# end

# p "Criadas #{Pessoa.count} pessoas"

# Cachorro.destroy_all

# 50.times do |index|
#   Cachorro.create!( nome: Faker::Creature::Dog.unique.name,
#   								data_de_nascimento: Faker::Date.birthday(0, 15),
#                   sexo: Faker::Creature::Dog.gender,
#                   porte: Faker::Creature::Dog.size,
#                   status: Faker::Subscription.status,
#                   observacoes: Faker::Lorem.paragraph,
#                   equipamento: Faker::Hipster.word,
#                   frequencia: Faker::Number.between(3, 5),
#                   duracao: Faker::Number.between(30, 60),
#                   areas: Faker::Address.community,
#                   disponivel_para_passeio: Faker::Boolean.boolean)
# end

# p "Criados #{Cachorro.count} cachorros"

# Passeio.destroy_all

# 200.times do |index|
#   Passeio.create!( pessoa_id: Faker::Number.between(1, 50),
#                   cachorro_id: Faker::Number.between(1, 50),
#                   status: Faker::Subscription.status,
#                   data_e_hora: Faker::Time.between(DateTime.now - 30, DateTime.now + 30))
# end

# p "Criados #{Passeio.count} passeios"

# Permissao.destroy_all

# 50.times do |index|
#   Permissao.create!( pessoa_id: Faker::Number.unique.between(1, 50),
#                   administracao: Faker::Boolean.boolean,
#                   passeio: Faker::Boolean.boolean,
#                   turno: Faker::Boolean.boolean)
# end

# p "Criadas #{Permissao.count} permissões"

# Canil.destroy_all

# 50.times do |index|
#   Canil.create!( cachorro_id: Faker::Number.unique.between(1, 50),
#                 corredor: 'A',
#                 numero: Faker::Number.between(1, 10))
# end

# p "Criados #{Canil.count} canis"

# Manutencao.destroy_all

# 100.times do |index|
#   Manutencao.create!( pessoa_id: Faker::Number.between(1, 50),
#                 canil_id: Faker::Number.between(1, 50),
#                 status: Faker::Subscription.status,
#                 data_e_hora: Faker::Time.between(DateTime.now - 30, DateTime.now + 30))
# end

# p "Criadas #{Manutencao.count} manutenções"