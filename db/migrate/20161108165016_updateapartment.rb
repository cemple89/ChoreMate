class Updateapartment < ActiveRecord::Migration[5.0]
  def change
    remove_column :apartments, :address
    remove_column :apartments, :city
    remove_column :apartments, :state
  end 
end
