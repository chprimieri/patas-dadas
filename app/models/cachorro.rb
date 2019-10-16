class Cachorro < ApplicationRecord
	enum status: [:ativo, :inativo]
	has_one_attached :foto

	validates :nome, :data_de_nascimento, :sexo, :porte, :status, :frequencia, :duracao, presence: true

	validate :image_type

	private

	def image_type
	  if foto.attached? 
	    if !foto.content_type.in?(%('image/jpeg image/png'))
	    	errors.add(:foto, "Apenas arquivos pjeg e png são aceitos.")
	   	end
	  end
	end
end
