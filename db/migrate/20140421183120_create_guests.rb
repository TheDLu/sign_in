class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :car

      t.timestamps
    end
  end
end
