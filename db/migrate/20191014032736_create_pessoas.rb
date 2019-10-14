class CreatePessoas < ActiveRecord::Migration[5.2]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.timestamp :data_de_nascimento
      t.string :telefone
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
