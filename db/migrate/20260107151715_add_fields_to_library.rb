class AddFieldsToLibrary < ActiveRecord::Migration[6.1]
  def change
    add_column :libraries, :added_by, :string unless column_exists?(:libraries, :added_by)
    add_column :libraries, :issued_to, :string unless column_exists?(:libraries, :issued_to)
    # doi and dor already exist, so we skip them
  end
end
