class CreateSanskritweekPhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :sanskritweek_photos do |t|
      t.integer :past_event_id
      t.integer :blob_id
      t.string :heading
      t.text :description

      t.timestamps
    end
  end
end
