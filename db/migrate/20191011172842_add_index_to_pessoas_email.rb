class AddIndexToPessoasEmail < ActiveRecord::Migration[5.0]
  def change
  	add_index :pessoas, :email
  end
end
