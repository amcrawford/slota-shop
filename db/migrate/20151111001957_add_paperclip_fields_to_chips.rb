class AddPaperclipFieldsToChips < ActiveRecord::Migration
  def change
    add_column :chips, :image_file_name,    :string
    add_column :chips, :image_content_type, :string
    add_column :chips, :image_file_size,    :integer
    add_column :chips, :image_updated_at,   :datetime
  end
end
