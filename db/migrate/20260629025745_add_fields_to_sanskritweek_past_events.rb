class AddFieldsToSanskritweekPastEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :sanskritweek_past_events, :photo_heading, :string
    add_column :sanskritweek_past_events, :photo_description, :text
  end
end
