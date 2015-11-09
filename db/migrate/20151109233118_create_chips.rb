class CreateChips < ActiveRecord::Migration
  def change
    create_table :chips do |t|
      t.string :name
      t.integer :price
      t.string :description

      t.timestamps null: false
    end
  end
end
