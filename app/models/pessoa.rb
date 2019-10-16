class Pessoa < ApplicationRecord
	has_secure_password
	has_many :passeios, dependent: :destroy

	validates :nome, :data_de_nascimento, :email, :telefone, presence: true
	validates :email, uniqueness: {case_sensitive: false}
	validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	before_save { self.email = email.downcase }
end
