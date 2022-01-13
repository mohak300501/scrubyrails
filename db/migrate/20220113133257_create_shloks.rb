class CreateShloks < ActiveRecord::Migration[6.1]
  def change
    create_table :shloks do |t|
      t.string :title
      t.string :shlok
      t.string :translation

      t.timestamps
    end
  end
end
