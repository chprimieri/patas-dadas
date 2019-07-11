class Passeio < ApplicationRecord
  belongs_to :pessoa
  belongs_to :cachorro

  validates :pessoa_id, :cachorro_id, :status, :data_e_hora, presence: true
end
