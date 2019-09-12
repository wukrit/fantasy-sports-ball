class Trade < ApplicationRecord
  belongs_to :given_player, class_name: "RosterPlayer"
  belongs_to :received_player, class_name: "RosterPlayer"
end
