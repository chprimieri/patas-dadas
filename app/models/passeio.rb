class Passeio < ApplicationRecord
  enum status: [:agendado, :realizado, :cancelado]
  belongs_to :pessoa, class_name: "Pessoa", foreign_key: "pessoa_id"
  belongs_to :cachorro_1, class_name: "Cachorro", foreign_key: "cachorro_1_id", optional: true
  belongs_to :cachorro_2, class_name: "Cachorro", foreign_key: "cachorro_2_id", optional: true
  belongs_to :cachorro_3, class_name: "Cachorro", foreign_key: "cachorro_3_id", optional: true

  validates :pessoa_id, :status, :data_e_hora, presence: true
  validate :confere_se_existe_cachorro
  validate :confere_cachorro_repetido
  validate :passeio_no_mesmo_horario

  scope :ordenado, -> { order(data_e_hora: :desc) }
  scope :agendados, -> { ordenado.where(status: :agendado) }
  scope :realizados, -> { ordenado.where(status: :realizado) }
  scope :cancelados, -> { ordenado.where(status: :cancelado) }

  def mudanca_de_status
    Passeio.agendados.each do |passeio|
      if passeio.data_e_hora < Time.now()
        passeio.status = "realizado"
      end
    end
  end
    
  private
  	def confere_se_existe_cachorro
  		if cachorro_1.blank? && cachorro_2.blank? && cachorro_3.blank?
  			errors.add(:cachorro_1, "Não se esqueça de indicar o cachorro para o passeio.")
  		end
  	end

    def confere_cachorro_repetido
      if mesmo_cachorro(cachorro_1, cachorro_2)
        errors.add(:cachorro_2, "Indique cachorros diferentes.")
      end

      if mesmo_cachorro(cachorro_1, cachorro_3)
        errors.add(:cachorro_3, "Indique cachorros diferentes.")
      end

      if mesmo_cachorro(cachorro_2, cachorro_3)
        errors.add(:cachorro_3, "Indique cachorros diferentes.")
      end
    end

    def passeio_no_mesmo_horario
      Passeio.agendados.each do |passeio_existente|

        # Primeiro testa se não é o mesmo passeio, para permitir edição
        if passeio_existente.id != self.id

          # Segundo, testa se os passeios são no mesmo horário
          if passeio_existente.data_e_hora.between?(data_e_hora - 1.hours, data_e_hora + 1.hours)

            # Por último, testa se são os mesmos cachorros
            if tres_cachorros_por_vez(cachorro_1, passeio_existente.cachorro_1, passeio_existente.cachorro_2, passeio_existente.cachorro_3)
              errors.add(:cachorro_1, "Este cachorro já está com um passeio agendado nesse horário.")
            end

            if tres_cachorros_por_vez(cachorro_2, passeio_existente.cachorro_1, passeio_existente.cachorro_2, passeio_existente.cachorro_3)
              errors.add(:cachorro_2, "Este cachorro já está com um passeio agendado nesse horário.")
            end

            if tres_cachorros_por_vez(cachorro_3, passeio_existente.cachorro_1, passeio_existente.cachorro_2, passeio_existente.cachorro_3)
              errors.add(:cachorro_3, "Este cachorro já está com um passeio agendado nesse horário.")
            end
          end
        end
      end
    end

    def tres_cachorros_por_vez(bibo, popis_1, popis_2, popis_3)
      if mesmo_cachorro(bibo, popis_1)
        return true
      elsif mesmo_cachorro(bibo, popis_2)
        return true
      elsif mesmo_cachorro(bibo, popis_3)
        return true
      else
        return false
      end          
    end

    def mesmo_cachorro(cachorro_1, cachorro_2)
      if !cachorro_1.nil? && !cachorro_2.nil?
        if cachorro_1 == cachorro_2
          return true
        end
      end

      return false
    end
end
