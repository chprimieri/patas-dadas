class DeleteDuplaIdToCachorro < ActiveRecord::Migration[5.2]
  def change
  	remove_column :cachorros, :dupla_id, :integer
  end
end
