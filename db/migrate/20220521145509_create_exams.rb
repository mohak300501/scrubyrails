class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.string :name
      t.string :info
    end
  end
end
