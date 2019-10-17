class AddStatusToPasseios < ActiveRecord::Migration[5.2]
  def change
  	add_column :passeios, :status, :integer
  end
end
