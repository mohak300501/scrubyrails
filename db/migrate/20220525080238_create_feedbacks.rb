class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :email
      t.string :type_of_feedback
      t.string :feedback

      t.timestamps
    end
  end
end
