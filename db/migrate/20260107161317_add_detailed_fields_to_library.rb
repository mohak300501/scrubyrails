class AddDetailedFieldsToLibrary < ActiveRecord::Migration[8.0]
  def change
    add_column :libraries, :primary_genre, :string
    add_column :libraries, :secondary_genre, :string
    add_column :libraries, :copies, :integer
    add_column :libraries, :present, :integer
    add_column :libraries, :content_language, :string
    add_column :libraries, :almirah, :string
    add_column :libraries, :rack, :string
    add_column :libraries, :location_in_rack, :string
  end
end
