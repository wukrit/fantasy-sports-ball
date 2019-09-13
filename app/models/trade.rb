class Trade < ApplicationRecord
  belongs_to :given_player, class_name: "RosterPlayer"
  belongs_to :received_player, class_name: "RosterPlayer"

  # accepts_nested_attributes_for :given_players_roster
  def commit_trade
    given_player = RosterPlayer.find(self.given_player_id)
    received_player = RosterPlayer.find(self.received_player_id)
    RosterPlayer.find(self.given_player_id).update(player_id: received_player.player_id)
    RosterPlayer.find(self.received_player_id).update(player_id: given_player.player_id)
  end

end
