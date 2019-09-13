class Player < ApplicationRecord
  has_many :roster_players
  has_many :rosters, through: :roster_players

  def self.filter_by_pos(pos)
    Player.all.select do |player|
      player.position == pos
    end
  end

end
