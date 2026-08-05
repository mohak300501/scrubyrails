class CreateSanskritweekPastEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :sanskritweek_past_events do |t|
      t.integer :year
      t.string :title
      t.text :description
      t.string :highlight_text
      t.string :cover_image_url

      t.timestamps
    end
  end
end
