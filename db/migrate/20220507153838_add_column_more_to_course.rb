class AddColumnMoreToCourse < ActiveRecord::Migration[6.1]
  def up
    add_column :courses, :more, :string
  end

  def down
    remove_column :courses, :more
  end
end
