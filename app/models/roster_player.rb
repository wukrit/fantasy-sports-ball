class RosterPlayer < ApplicationRecord
  belongs_to :roster
  belongs_to :player
end
