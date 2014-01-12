class DropOrderTypes < ActiveRecord::Migration
  def up
    drop_table :order_types
    remove_column :orders, :order_type_id
    remove_column :orders, :bike_reg_id
  end

  def down
  end
end
