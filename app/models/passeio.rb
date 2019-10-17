class Passeio < ApplicationRecord
  enum status: [:agendado, :realizado, :cancelado]
  belongs_to :pessoa, class_name: "Pessoa", foreign_key: "pessoa_id"
  belongs_to :cachorro_1, class_name: "Cachorro", foreign_key: "cachorro_1_id"
  belongs_to :cachorro_2, class_name: "Cachorro", foreign_key: "cachorro_2_id"
  belongs_to :cachorro_3, class_name: "Cachorro", foreign_key: "cachorro_3_id"

  validates :pessoa_id, :status, :data_e_hora, presence: true
  validate :existe_cachorro

  private
  	def existe_cachorro
  		if cachorro_1.blank? && cachorro_2.blank? && cachorro_3.blank?
  			errors.add(:cachorro_1, "Não se esqueça de indicar o cachorro para o passeio.")
  		end
  	end
end
