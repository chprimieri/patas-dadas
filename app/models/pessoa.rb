class Pessoa < ApplicationRecord
	validates :nome, :data_de_nascimento, :email, :telefone, presence: true
	validates :email, uniqueness: true
	validates :foto, allow_blank: true, format: {
		with: %r{\.(jpg|png)\Z}i,
		message: 'Deve ser uma imagem JPG ou PNG.'
	}
end
