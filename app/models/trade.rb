class Trade < ApplicationRecord
  belongs_to :given_player, class_name: "RosterPlayer"
  belongs_to :received_player, class_name: "RosterPlayer"

  validate :check_trade

  # accepts_nested_attributes_for :given_players_roster
  def commit_trade
    given_player = RosterPlayer.find(self.given_player_id)
    received_player = RosterPlayer.find(self.received_player_id)
    RosterPlayer.find(self.given_player_id).update(player_id: received_player.player_id)
    RosterPlayer.find(self.received_player_id).update(player_id: given_player.player_id)
  end

  def check_trade
    given_player = RosterPlayer.find(self.given_player_id)
    received_player = RosterPlayer.find(self.received_player_id)
    if given_player.roster.players.include?(Player.find(received_player.player.id)) || received_player.roster.players.include?(Player.find(given_player.player.id))
      self.errors[:invalid_trade] << "| A roster would end up with duplicate players"
    end
  end

end
