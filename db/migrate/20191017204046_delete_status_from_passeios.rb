class DeleteStatusFromPasseios < ActiveRecord::Migration[5.2]
  def change
  	remove_column :passeios, :status, :string
  end
end
