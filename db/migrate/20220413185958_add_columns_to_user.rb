class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :profile, :boolean
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :pin, :int
    add_column :users, :gender, :string
    add_column :users, :age, :int
    add_column :users, :mobile, :int
    add_column :users, :sanslevel, :string
    add_column :users, :acadqual, :string
  end
end
