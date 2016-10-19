class CreateChores < ActiveRecord::Migration[5.0]
  def change
    create_table :chores do |t|
      t.string :name, null:false
      t.integer :completion_interval, null: false
      t.belongs_to :apartment, null: false
      t.belongs_to :user, optional: true
      t.datetime :last_completed, optional: true
      t.datetime :due_by, optional: true  
    end
  end
end
