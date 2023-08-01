class ChangeBgvars < ActiveRecord::Migration[6.1]
  def up
    rename_column :bgvars, :id, :visits
    add_column :bgvars, :regid, :string
  end

  def down
    rename_column :bgvars, :visits, :id
    remove_column :bgvars, :regid
  end
end
