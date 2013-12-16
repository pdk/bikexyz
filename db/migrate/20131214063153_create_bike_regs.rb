class CreateBikeRegs < ActiveRecord::Migration
  def change
    create_table :bike_regs do |t|
      t.string :xyz_code, :null => false
      t.string :serial_number
      t.string :color
      t.string :brand
      t.string :model
      t.string :kind
      t.string :size
      t.integer :number_of_gears
      t.text :notes
      t.string :name
      t.string :alternate_name
      t.string :city
      t.string :state
      t.string :country
      t.string :primary_email
      t.string :second_email
      t.string :third_email
      t.string :cell_phone_one
      t.string :cell_phone_two

      t.timestamps
    end
    
    add_index :bike_regs, :xyz_code, { :unique => true }
  end
end
