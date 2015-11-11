class AddSlugToChips < ActiveRecord::Migration
  def change
    add_column :chips, :slug, :string
  end
end
