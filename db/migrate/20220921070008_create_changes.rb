class CreateChanges < ActiveRecord::Migration[7.0]
  def change
    create_table :changes do |t|
      t.string :time
      t.string :email
      t.string :table
      t.string :cord
    end
  end
end
