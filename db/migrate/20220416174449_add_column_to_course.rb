class AddColumnToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :cname, :string
  end
end
