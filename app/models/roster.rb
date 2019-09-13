class Roster < ApplicationRecord
  belongs_to :user
  has_many :roster_players, dependent: :destroy
  has_many :players, through: :roster_players

  validates :team_name, presence: true

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
      [roster_player.id, "#{roster_player.player.name} | #{roster_player.player.position} "]
    end
  end

  def self.filter_position(player_id, collection_selected_roster)
    given_position = RosterPlayer.find(player_id).player.position
    collection_selected_roster.select do |player|
      RosterPlayer.find(player[0]).player.position == given_position
    end
  end

  def assign_random_players
    self.roster_players.destroy_all
    positions = {"QB1" => "QB", "RB1" => "RB", "RB2" => "RB", "WR1" => "WR", "WR2" => "WR", "TE" => "TE", "DEF" => "DEF", "K" => "K"}

    positions.each do |rp, pos|
      player = Player.filter_by_pos(pos).sample
      self.roster_players << RosterPlayer.create(player_id: player.id, roster_position: rp)
    end

    if self.roster_players.count != 8
      self.assign_random_players
    end

  end

  # accepts_nested_attributes_for :roster_players
end
