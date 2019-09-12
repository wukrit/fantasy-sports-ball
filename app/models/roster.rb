class Roster < ApplicationRecord
  belongs_to :user
  has_many :roster_players, dependent: :destroy
  has_many :players, through: :roster_players

  def sorted_players
    order = ["QB1", "RB1", "RB2", "WR1", "WR2", "TE", "DEF", "K"]
    sorted_players = []
    order.each do |position|
      sorted_players << self.roster_players.find_by(roster_position: position)
    end
    sorted_players
  end

  def for_collection_select
    self.roster_players.map do |roster_player|
      [roster_player.player.name, roster_player.player.id]
    end
  end

  # accepts_nested_attributes_for :roster_players
end
