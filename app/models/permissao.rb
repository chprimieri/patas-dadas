class Permissao < ApplicationRecord
  belongs_to :pessoa
  before_save :default_values

  scope :ordenado, -> { joins(:pessoa).order("pessoas.nome") }
  scope :passeadores, -> { ordenado.where(passeio: true) }
  scope :administradores, -> { ordenado.where(administracao: true) }

  def default_values
  	self.passeio = false if self.passeio.nil?
  	self.administracao = false if self.administracao.nil?
	end


end
