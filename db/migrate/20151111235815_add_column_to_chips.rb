class AddColumnToChips < ActiveRecord::Migration
  def change
    add_column :chips, :status, :string, default: "available"
  end
end
