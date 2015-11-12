class CreateChipOrders < ActiveRecord::Migration
  def change
    create_table :chip_orders do |t|
      t.references :chip, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.integer :quantity
      t.integer :subtotal
    end
  end
end
