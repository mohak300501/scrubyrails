class ChangeMobileToBeStringInUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :mobile, :string
  end

  def down
    chagne_column :users, :mobile, :int
  end
end
