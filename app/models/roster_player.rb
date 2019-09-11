class RosterPlayer < ApplicationRecord
  belongs_to :roster
  belongs_to :player

  validates :player, uniqueness: {scope: :roster}
end
