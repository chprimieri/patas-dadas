class Passeio < ApplicationRecord
  belongs_to :pessoa, class_name: "Pessoa", foreign_key: "pessoa_id"
  belongs_to :cachorro, class_name: "Cachorro", foreign_key: "cachorro_id"

  validates :pessoa_id, :cachorro_id, :status, :data_e_hora, presence: true
end
