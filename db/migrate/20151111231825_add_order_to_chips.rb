class AddOrderToChips < ActiveRecord::Migration
  def change
    add_reference :chips, :order, index: true, foreign_key: true
  end
end
