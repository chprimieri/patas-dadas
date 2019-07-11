# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'
I18n.reload!

Faker::Config.locale = 'pt-BR'

Pessoa.destroy_all

50.times do |index|
  Pessoa.create!( nome: Faker::Name.unique.name,
  								data_de_nascimento: Faker::Date.birthday(18, 65),
                  email: Faker::Internet.unique.email,
                  telefone: Faker::PhoneNumber.phone_number,
                  foto: "pessoa.jpg")
end

p "Criadas #{Pessoa.count} pessoas"

Cachorro.destroy_all

50.times do |index|
  Cachorro.create!( nome: Faker::Creature::Dog.unique.name,
  								data_de_nascimento: Faker::Date.birthday(0, 15),
                  sexo: Faker::Creature::Dog.gender,
                  porte: Faker::Creature::Dog.size,
                  status: Faker::Subscription.status,
                  observacoes: Faker::Lorem.paragraph,
                  equipamento: Faker::Hipster.word,
                  frequencia: Faker::Number.between(3, 5),
                  duracao: Faker::Number.between(30, 60),
                  areas: Faker::Address.community,
                  disponivel_para_passeio: Faker::Boolean.boolean)
end

p "Criados #{Cachorro.count} cachorros"