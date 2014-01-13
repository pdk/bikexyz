class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_type_id
      t.string :name
      t.text :description
      t.column :price, :decimal, :precision => 8, :scale => 2
      t.integer :stock

      t.timestamps
    end
  end
end
