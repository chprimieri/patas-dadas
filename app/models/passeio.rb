class Passeio < ApplicationRecord
  belongs_to :pessoa
  belongs_to :cachorro
end
