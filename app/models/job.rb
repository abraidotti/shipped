class Job < ApplicationRecord
  validates_length_of :description, minimum: 20, too_short: "please enter at least 20 characters"
  validates :cost, numericality: {greater_than: 999.99}
  has_many :boats
  has_many :users, through: :boats
end