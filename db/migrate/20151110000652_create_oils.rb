class CreateOils < ActiveRecord::Migration
  def change
    create_table :oils do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
