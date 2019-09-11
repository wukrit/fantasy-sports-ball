class Roster < ApplicationRecord
  belongs_to :user
  has_many :roster_players, dependent: :destroy
  has_many :players, through: :roster_players

  # accepts_nested_attributes_for :roster_players
end
