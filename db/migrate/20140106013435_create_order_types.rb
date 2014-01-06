class CreateOrderTypes < ActiveRecord::Migration
  def change
    create_table :order_types do |t|
      t.string :name
      t.text :description
      t.column :price, :decimal, :precision => 8, :scale => 2
  
      t.timestamps
    end
  end
end
