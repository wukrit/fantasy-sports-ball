class Team < ApplicationRecord

  def find_players
    Player.all.select do |player|
      player.team == self.code
    end
  end

end
