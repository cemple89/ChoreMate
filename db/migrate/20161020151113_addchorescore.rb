class Addchorescore < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :chorescore, :integer 
  end
end
