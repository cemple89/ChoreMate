class Addchorepoints < ActiveRecord::Migration[5.0]
  def change
    add_column :chores, :points, :integer, null: false  
  end
end
