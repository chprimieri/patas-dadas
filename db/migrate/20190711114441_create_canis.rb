class CreateCanis < ActiveRecord::Migration[5.0]
  def change
    create_table :canis do |t|
      t.belongs_to :cachorro, foreign_key: true
      t.string :corredor
      t.integer :numero

      t.timestamps
    end
  end
end
