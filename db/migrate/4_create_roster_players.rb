class CreateRosterPlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :roster_players do |t|
      t.belongs_to :roster, null: false, foreign_key: true
      t.belongs_to :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
