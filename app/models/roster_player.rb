class RosterPlayer < ApplicationRecord
  belongs_to :roster
  belongs_to :player
  has_many :trades

  has_many :traded_for_players, foreign_key: :given_player_id, class_name: "Trade"
  has_many :received_players, through: :traded_for_players

  has_many :traded_players, foreign_key: :received_player_id, class_name: "Trade"
  has_many :given_players, through: :traded_players

  validates :player, uniqueness: {scope: :roster}


end
