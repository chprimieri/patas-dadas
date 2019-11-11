class CreatePasseios < ActiveRecord::Migration[5.2]
  def change
    create_table :passeios do |t|
      t.references :pessoa, foreign_key: true
      t.references :cachorro_1, foreign_key: { to_table: 'cachorros' }
      t.references :cachorro_2, foreign_key: { to_table: 'cachorros' }
      t.references :cachorro_3, foreign_key: { to_table: 'cachorros' }
      t.string :status
      t.timestamp :data_e_hora

      t.timestamps
    end
  end
end
