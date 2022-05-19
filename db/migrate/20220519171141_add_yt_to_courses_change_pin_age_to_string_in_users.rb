class AddYtToCoursesChangePinAgeToStringInUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :courses, :yt, :string
    change_column :users, :pin, :string
    change_column :users, :age, :string
  end

  def down
    remove_column :courses, :yt
    change_column :users, :pin, :int
    change_column :users, :age, :int
  end
end
