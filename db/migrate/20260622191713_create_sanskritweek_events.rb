class CreateSanskritweekEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :sanskritweek_events do |t|
      t.string :title
      t.string :title_sanskrit
      t.string :category
      t.integer :day
      t.text :description
      t.string :venue
      t.string :team_size
      t.string :poster_url
      t.string :status

      t.timestamps
    end
  end
end
