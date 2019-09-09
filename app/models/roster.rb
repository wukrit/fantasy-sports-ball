class Roster < ApplicationRecord
  belongs_to :user
  has_many :roster_players, dependent: :destroy
  has_many :players, through: :roster_players
end
