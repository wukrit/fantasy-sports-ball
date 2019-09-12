class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.integer :given_player_id
      t.integer :received_player_id
    end
  end
end
