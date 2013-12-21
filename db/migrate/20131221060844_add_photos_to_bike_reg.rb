class AddPhotosToBikeReg < ActiveRecord::Migration
  def change
    add_column :bike_regs, :photo_1, :string
    add_column :bike_regs, :photo_2, :string
    add_column :bike_regs, :photo_3, :string
    add_column :bike_regs, :photo_4, :string
    add_column :bike_regs, :photo_5, :string
    add_column :bike_regs, :photo_6, :string
  end
end
