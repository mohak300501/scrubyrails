class CreateShloks < ActiveRecord::Migration[6.1]
  def change
    create_table :shloks do |t|
      t.string :title
      t.string :shlok
      t.string :translation
      t.string :updated_by

      t.timestamps
    end
  end
end
