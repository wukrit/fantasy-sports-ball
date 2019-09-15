class User < ApplicationRecord
  has_secure_password
  has_many :rosters, dependent: :destroy

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :age, numericality: {greater_than: 0, less_than: 110}

  def find_trades
    trades = []
    self.rosters.each do |roster|
      roster.roster_players.each do |rp|
        if Trade.find_by(received_player_id: rp.id)
          trades << Trade.find_by(received_player_id: rp.id)
        end
      end
    end
    trades
  end

  def make_random_roster
    roster = Roster.create(user_id: self.id, team_name: "#{self.username}'s Random Roster")
    roster.update(team_name: "#{roster.team_name} #{roster.id}")

    roster.assign_random_players
    roster
  end

end
