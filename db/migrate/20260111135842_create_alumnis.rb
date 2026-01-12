class CreateAlumnis < ActiveRecord::Migration[8.0]
  def change
    create_table :alumnis do |t|
      t.string :name
      t.string :branch
      t.string :mail
      t.string :linkedin
      t.string :image

      t.timestamps
    end
  end
end
