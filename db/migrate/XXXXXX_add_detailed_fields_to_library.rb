class AddDetailedFieldsToLibrary < ActiveRecord::Migration[6.1]
  def change
    # Add new fields
    add_column :libraries, :primary_genre, :string
    add_column :libraries, :secondary_genre, :string
    add_column :libraries, :copies, :integer, default: 0
    add_column :libraries, :present, :integer, default: 0
    add_column :libraries, :content_language, :string
    add_column :libraries, :almirah, :string
    add_column :libraries, :rack, :string
    add_column :libraries, :location_in_rack, :string
    
    # Remove description if it exists
    remove_column :libraries, :description, :text if column_exists?(:libraries, :description)
  end
end