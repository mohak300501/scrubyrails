class MakePublisherOptionalInLibrary < ActiveRecord::Migration[6.1]
  def change
    change_column_null :libraries, :publisher, true
  end
end