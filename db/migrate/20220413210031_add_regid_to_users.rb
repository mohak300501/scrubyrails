class AddRegidToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :regid, :string
  end
end
