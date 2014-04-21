class AddResidenceIdToResidents < ActiveRecord::Migration
  def change
    add_column :residents, :residence_id, :integer
    add_index :residents, :residence_id
  end
end
