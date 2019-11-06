class Pessoa < ApplicationRecord
	has_secure_password
	has_many :passeios, dependent: :destroy

	validates :nome, :data_de_nascimento, :email, :telefone, presence: true
	validates :email, uniqueness: {case_sensitive: false}
	validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	before_save { self.email = email.downcase }
	validates :password, presence: true, length: {minimum: 6}
	validates :telefone, :numericality => true, :length => { :minimum => 10, :maximum => 11 }
	validate :data_de_nascimento_valida

	private
		def data_de_nascimento_valida
	    if data_de_nascimento.present? 
	    	if data_de_nascimento > Date.today + 12.year || data_de_nascimento < Date.today - 100.year
	      	errors.add(:data_de_nascimento, "não é válida.")
	      end
	    end
	  end
end
