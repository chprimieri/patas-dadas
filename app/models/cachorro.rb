class Cachorro < ApplicationRecord
	enum status: [:ativo, :inativo]

	validates :nome, :data_de_nascimento, :sexo, :porte, :frequencia, :duracao, presence: true
	validates :foto, allow_blank: true, format: {
		with: %r{\.(jpg|png)\Z}i,
		message: 'Deve ser uma imagem JPG ou PNG.'
	}
end
