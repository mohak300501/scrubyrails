class CreateLibraries < ActiveRecord::Migration[6.1]
  def change
    create_table :libraries do |t|
      t.string :bookid
      t.string :name
      t.string :link
      t.string :description
      t.string :author
      t.string :publisher
      t.integer :units
      t.string :addedby
      t.string :issuedto
      t.string :doi
      t.string :dor

      t.timestamps
    end
  end
end
