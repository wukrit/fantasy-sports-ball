class User < ApplicationRecord
  has_many :rosters, dependent: :destroy

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :age, numericality: {greater_than: 0, less_than: 110}
end
