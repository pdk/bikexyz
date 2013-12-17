class CreateAuthKeys < ActiveRecord::Migration
  def change
    create_table :auth_keys do |t|
      t.string :email, :null => false
      t.string :key, :null => false

      t.timestamps
    end
  end
end
