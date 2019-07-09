class CreatePessoas < ActiveRecord::Migration[5.0]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.timestamp :data_de_nascimento
      t.string :email
      t.string :telefone
      t.string :foto

      t.timestamps
    end
  end
end
