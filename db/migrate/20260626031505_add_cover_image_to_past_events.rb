class AddCoverImageToPastEvents < ActiveRecord::Migration[8.0]
  def change
    # We'll use Active Storage has_many_attached for multiple photos
    # No column needed — Active Storage handles it
  end
end