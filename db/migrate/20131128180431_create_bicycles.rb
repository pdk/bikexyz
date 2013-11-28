class CreateBicycles < ActiveRecord::Migration
  def change
    create_table :bicycles do |t|
      t.string :lookup_code
      t.string :owner_name
      t.string :owner_alternate_name
      t.string :make
      t.string :model
      t.string :type
      t.string :color
      t.string :size
      t.string :serial
      t.integer :gears
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
