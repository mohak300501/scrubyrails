class CreateGroupPhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :group_photos do |t|

      t.timestamps
    end
  end
end
