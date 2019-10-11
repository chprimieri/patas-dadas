class AddPasswordDigestToPessoas < ActiveRecord::Migration[5.0]
  def change
    add_column :pessoas, :password_digest, :string
  end
end
