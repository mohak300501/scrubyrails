class AddTypeToExams < ActiveRecord::Migration[6.1]
  def change
    add_column :exams, :etype, :boolean, null:false, default:true
  end
end
