class CreatePasseios < ActiveRecord::Migration[5.0]
  def change
    create_table :passeios do |t|
      t.belongs_to :pessoa, foreign_key: true
      t.belongs_to :cachorro, foreign_key: true
      t.string :status
      t.timestamp :data_e_hora

      t.timestamps
    end
  end
end
