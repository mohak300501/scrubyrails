class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :email
      t.string :typef
      t.string :feedback
    end
  end
end
