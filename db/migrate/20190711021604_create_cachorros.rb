class CreateCachorros < ActiveRecord::Migration[5.0]
  def change
    create_table :cachorros do |t|
      t.string :nome
      t.timestamp :data_de_nascimento
      t.string :sexo
      t.string :porte
      t.string :foto
      t.string :status
      t.text :observacoes
      t.string :equipamento
      t.integer :dupla_id
      t.integer :frequencia
      t.integer :duracao
      t.string :areas
      t.boolean :disponivel_para_passeio

      t.timestamps
    end
  end
end
