class CreateAbouts < ActiveRecord::Migration[6.1]
  def change
    create_table :abouts do |t|
      t.string :about
      t.string :htuse
      t.string :terms

      t.timestamps
    end
  end
end
