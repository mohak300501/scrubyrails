class AddLinkedinToTeams < ActiveRecord::Migration[8.0]
  def change
    add_column :teams, :linkedin, :string
  end
end
