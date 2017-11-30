class Job < ApplicationRecord
  validates_length_of :description, minimum: 20, too_short: "please enter at least 20 characters"
  validates :cost, numericality: {greater_than: 999.99}
  has_and_belongs_to_many :boats
  has_many :users, through: :boats

  validates :origin, uniqueness: { scope: :destination, message: "Origin and destination should be different." }
end
