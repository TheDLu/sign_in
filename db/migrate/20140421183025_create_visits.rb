class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.datetime :visit_in
      t.datetime :visit_out

      t.timestamps
    end
  end
end
