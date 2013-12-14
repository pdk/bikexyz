class CreateUserBicycles < ActiveRecord::Migration
  def change
    create_table :user_bicycles do |t|
      t.integer :user_id
      t.integer :bicycle_id
      t.string :kind

      t.timestamps
    end
  end
end
