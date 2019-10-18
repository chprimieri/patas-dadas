class Passeio < ApplicationRecord
  enum status: [:agendado, :realizado, :cancelado]
  belongs_to :pessoa, class_name: "Pessoa", foreign_key: "pessoa_id"
  belongs_to :cachorro_1, class_name: "Cachorro", foreign_key: "cachorro_1_id", optional: true
  belongs_to :cachorro_2, class_name: "Cachorro", foreign_key: "cachorro_2_id", optional: true
  belongs_to :cachorro_3, class_name: "Cachorro", foreign_key: "cachorro_3_id", optional: true

  validates :pessoa_id, :status, :data_e_hora, presence: true
  validate :existe_cachorro
  validate :cachorro_repetido
  validate :passeio_no_mesmo_horario

  scope :agendados, -> { where(status: :agendado) }

  def mudanca_de_status
    Passeio.agendados.each do |passeio|
      if passeio.data_e_hora < Time.now()
        passeio.status = 1
      end
    end
  end
    
  private
  	def existe_cachorro
  		if cachorro_1.blank? && cachorro_2.blank? && cachorro_3.blank?
  			errors.add(:cachorro_1, "Não se esqueça de indicar o cachorro para o passeio.")
  		end
  	end

    def cachorro_repetido
      if !cachorro_1.nil? && !cachorro_2.nil?
        if cachorro_1 == cachorro_2
          errors.add(:cachorro_2, "Indique cachorros diferentes.")
        end
      end

      if !cachorro_1.nil? && !cachorro_3.nil?
        if cachorro_1 == cachorro_3
          errors.add(:cachorro_3, "Indique cachorros diferentes.")
        end
      end

      if !cachorro_2.nil? && !cachorro_3.nil?
        if cachorro_2 == cachorro_3
          errors.add(:cachorro_3, "Indique cachorros diferentes.")
        end
      end
    end

    def passeio_no_mesmo_horario

    end
end
