class Removeoldusercolumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :last_signed_in_at, :datetime
    remove_column :users, :oauth_uid, :string
    remove_column :users, :sign_in_count, :integer
  end
end
