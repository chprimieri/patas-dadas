class AddDuploFromCanis < ActiveRecord::Migration[5.0]
  def change
    add_column :canis, :duplo, :boolean
  end
end
