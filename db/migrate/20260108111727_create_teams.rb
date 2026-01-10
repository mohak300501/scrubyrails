class CreateTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :year
      t.string :branch
      t.string :mail

      t.timestamps
    end
  end
end
