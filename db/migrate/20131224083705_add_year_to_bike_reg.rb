class AddYearToBikeReg < ActiveRecord::Migration
  def change
    add_column :bike_regs, :year, :integer
  end
end
