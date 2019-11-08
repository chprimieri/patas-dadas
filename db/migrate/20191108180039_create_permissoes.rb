class CreatePermissoes < ActiveRecord::Migration[5.2]
  def change
    create_table :permissoes do |t|
      t.belongs_to :pessoa, foreign_key: true
      t.boolean :administracao
      t.boolean :passeio

      t.timestamps
    end
  end
end
