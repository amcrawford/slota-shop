class ChangeChipsPrice < ActiveRecord::Migration
  def change
    change_column :chips, :price, :float
    change_column :orders, :total_price, :float
    change_column :chip_orders, :subtotal, :float
    change_column :orders, :status, :string, default: "Ordered"
  end
end
