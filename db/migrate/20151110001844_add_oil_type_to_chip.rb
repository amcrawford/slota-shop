class AddOilTypeToChip < ActiveRecord::Migration
  def change
    add_reference :chips, :oil_type, index: true, foreign_key: true
  end
end
