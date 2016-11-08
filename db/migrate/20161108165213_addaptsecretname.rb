class Addaptsecretname < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :name, :string, null:false
    add_column :apartments, :secret, :string, null:false 
  end
end
