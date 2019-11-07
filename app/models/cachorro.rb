class Cachorro < ApplicationRecord
	enum status: [:ativo, :inativo]
	has_many :passeios_1, foreign_key: "cachorro_1_id", class_name: "Passeio", dependent: :destroy
	has_many :passeios_2, foreign_key: "cachorro_2_id", class_name: "Passeio", dependent: :destroy
	has_many :passeios_3, foreign_key: "cachorro_3_id", class_name: "Passeio", dependent: :destroy
	has_one :dupla, class_name: 'Cachorro', foreign_key: 'dupla_id'
	belongs_to :dupla, class_name: 'Cachorro', foreign_key: 'dupla_id', optional: true
	has_one_attached :foto

	validates :nome, :data_de_nascimento, :sexo, :porte, :status, presence: true
	validate :image_type
	validates_inclusion_of :disponivel_para_passeio, :in => [true, false]
	validate :data_de_nascimento_valida

	scope :caes_ativos, -> { where(status: :ativo) }
	scope :passeadores, -> { caes_ativos.where(disponivel_para_passeio: true) }

	private
		def image_type
		  if foto.attached? 
		    if !foto.content_type.in?(%w(image/jpeg image/png))
		    	errors.add(:foto, "Apenas arquivos pjeg e png são aceitos.")
		   	end
		  end
		end

		def data_de_nascimento_valida
	    if data_de_nascimento.present? 
	    	if data_de_nascimento > Date.today || data_de_nascimento < Date.today - 25.year
	      	errors.add(:data_de_nascimento, "não é válida.")
	      end
	    end
	  end
end
