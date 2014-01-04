class AddSearchableTextToBikeRegs < ActiveRecord::Migration
  def change
    add_column :bike_regs, :searchable_text, :text
  end
end
