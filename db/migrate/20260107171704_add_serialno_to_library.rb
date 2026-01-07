class AddSerialnoToLibrary < ActiveRecord::Migration[8.0]
  def change
    add_column :libraries, :serialno, :string
  end
end
