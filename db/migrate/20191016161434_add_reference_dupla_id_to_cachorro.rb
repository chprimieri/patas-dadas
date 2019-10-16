class AddReferenceDuplaIdToCachorro < ActiveRecord::Migration[5.2]
  def change
  	add_reference :cachorros, :dupla, index: true
  end
end
