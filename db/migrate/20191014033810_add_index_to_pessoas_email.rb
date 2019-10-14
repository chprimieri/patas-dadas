class AddIndexToPessoasEmail < ActiveRecord::Migration[5.2]
  def change
  	add_index :pessoas, :email
  end
end
