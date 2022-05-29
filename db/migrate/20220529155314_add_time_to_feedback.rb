class AddTimeToFeedback < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :time, :string
  end
end
