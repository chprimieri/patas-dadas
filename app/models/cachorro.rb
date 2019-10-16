class Cachorro < ApplicationRecord
	enum status: [:ativo, :inativo]
	has_one_attached :foto
	has_one :cachorro, class_name: 'Cachorro', foreign_key: 'dupla_id'

	validates :nome, :data_de_nascimento, :sexo, :porte, :status, presence: true
	validate :image_type
	validates_inclusion_of :disponivel_para_passeio, :in => [true, false]

	scope :passeadores, -> { where(disponivel_para_passeio: true) }

	private

	def image_type
	  if foto.attached? 
	    if !foto.content_type.in?(%('image/jpeg image/png'))
	    	errors.add(:foto, "Apenas arquivos pjeg e png são aceitos.")
	   	end
	  end
	end
end
