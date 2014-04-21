class AddResidentIdToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :resident_id, :integer
    add_index :visits, :resident_id
  end
end
