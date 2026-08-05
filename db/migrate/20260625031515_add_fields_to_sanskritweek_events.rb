class AddFieldsToSanskritweekEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :sanskritweek_events, :date, :string
    add_column :sanskritweek_events, :time, :string
    add_column :sanskritweek_events, :eligibility, :string
    add_column :sanskritweek_events, :prize, :string
    add_column :sanskritweek_events, :registration_link, :string
  end
end
