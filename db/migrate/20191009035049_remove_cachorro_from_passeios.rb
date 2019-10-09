class RemoveCachorroFromPasseios < ActiveRecord::Migration[5.0]
  def change
    remove_column :passeios, :cachorro_id, :integer
  end
end
