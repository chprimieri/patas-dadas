class CreatePasseios < ActiveRecord::Migration[5.2]
  def change
    create_table :passeios do |t|
      t.belongs_to :pessoa, foreign_key: true
      t.belongs_to :cachorro_1, foreign_key: 'cachorro_1_id', class_name: 'Cachorro'
      t.belongs_to :cachorro_2, foreign_key: 'cachorro_2_id', class_name: 'Cachorro'
      t.belongs_to :cachorro_3, foreign_key: 'cachorro_3_id', class_name: 'Cachorro'
      t.string :status
      t.timestamp :data_e_hora

      t.timestamps
    end
  end
end
