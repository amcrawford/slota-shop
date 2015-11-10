class AddOilToChip < ActiveRecord::Migration
  def change
    add_reference :chips, :oil, index: true, foreign_key: true
  end
end
