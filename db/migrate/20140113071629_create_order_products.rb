class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.string :xyz_code
      t.integer :count

      t.timestamps
    end
  end
end
