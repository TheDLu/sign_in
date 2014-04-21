class AddGuestIdToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :guest_id, :integer
    add_index :visits, :guest_id
  end
end
