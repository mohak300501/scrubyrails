class AddRegonColumnToCourse < ActiveRecord::Migration[6.1]
  def up
    add_column :courses, :regon, :string
  end

  def down
    remove_column :courses, :regon
  end
end
