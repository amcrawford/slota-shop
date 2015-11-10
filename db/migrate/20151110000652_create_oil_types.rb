class CreateOilTypes < ActiveRecord::Migration
  def change
    create_table :oil_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
