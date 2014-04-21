class AddUserIdToResidences < ActiveRecord::Migration
  def change
    add_column :residences, :user_id, :integer
    add_index :residences, :user_id
  end
end
