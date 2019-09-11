class AddRosterPositionToRosterPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :roster_players, :roster_position, :string
  end
end
