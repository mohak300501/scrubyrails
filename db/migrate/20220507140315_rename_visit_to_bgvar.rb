class RenameVisitToBgvar < ActiveRecord::Migration[6.1]
  def up
    rename_table :visits, :bgvars
  end

  def down
    rename_table :bgvars, :visits
  end
end
