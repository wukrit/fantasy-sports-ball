class Player < ApplicationRecord
  has_many :roster_players
  has_many :rosters, through: :roster_players
end
