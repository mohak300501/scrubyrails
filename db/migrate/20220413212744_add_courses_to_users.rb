class AddCoursesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :courses, :string
  end
end
