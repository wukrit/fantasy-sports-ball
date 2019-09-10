class Team < ApplicationRecord

  def self.alphabetical
    self.all.order(:name)
  end

  def find_players
    Player.all.select do |player|
      player.team == self.code
    end
  end

end
