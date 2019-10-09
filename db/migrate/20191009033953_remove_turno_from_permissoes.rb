class RemoveTurnoFromPermissoes < ActiveRecord::Migration[5.0]
  def change
    remove_column :permissoes, :turno, :boolean
  end
end
