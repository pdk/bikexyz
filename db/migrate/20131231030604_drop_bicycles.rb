class DropBicycles < ActiveRecord::Migration
  def up
    drop_table :bicycles
    drop_table :user_bicycles
  end

  def down
  end
end
